import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_siakad_app/data/models/request/auth_request_model.dart';
import 'package:flutter_siakad_app/pages/dosen/dosen_page.dart';
import 'package:flutter_siakad_app/pages/mahasiswa/mahasiswa_page.dart';

import '../../../bloc/login/login_bloc.dart';
import '../../../common/constants/colors.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/custom_text_field.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({
    super.key,
  });

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 40.0),
            ],
          ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              const Text(
                "Selamat Datang",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                "Masukkan Email dan password agar bisa mengakses informasi administrasi.",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              const SizedBox(height: 50.0),
              CustomTextField(
                controller: usernameController,
                label: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12.0),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loaded: (data) {
                      AuthLocalDatasource().saveAuthData(data);
                      if (data.user.roles == 'mahasiswa') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const MahasiswaPage();
                        }));
                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const DosenPage();
                        }));
                      }
                    },
                    error: (message) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: Text(message),
                            );
                          });
                    },
                  );
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Button.filled(
                          onPressed: () {
                            final requestModel = AuthRequestModel(
                              email: usernameController.text,
                              password: passwordController.text,
                            );
                            context
                                .read<LoginBloc>()
                                .add(LoginEvent.login(requestModel));
                          },
                          label: 'Masuk',
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ],
      ),
    );
  }
}
