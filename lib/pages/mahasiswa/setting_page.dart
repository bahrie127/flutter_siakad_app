import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_siakad_app/bloc/logout/logout_bloc.dart';
import 'package:flutter_siakad_app/data/datasources/auth_local_datasource.dart';

import '../auth/auth_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (context) => LogoutBloc(),
        child: BlocConsumer<LogoutBloc, LogoutState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: () {
                AuthLocalDatasource().removeAuthData();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const AuthPage();
                }));
              },
              error: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('logout error'),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return ElevatedButton(
                  onPressed: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                  child: const Text('Logout'),
                );
              },
              loaded: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
