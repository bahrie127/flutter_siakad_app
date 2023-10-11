import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_siakad_app/bloc/khs/khs_bloc.dart';

import '../../common/constants/colors.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/row_text.dart';

class KhsPage extends StatefulWidget {
  const KhsPage({super.key});

  @override
  State<KhsPage> createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  @override
  void initState() {
    super.initState();
    context.read<KhsBloc>().add(const KhsEvent.getKhs());
  }

  double ipk = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // padding: const EdgeInsets.all(24.0),
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          const Text(
            "KHS Mahasiswa",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "14 of 64 results",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: Image.network(
                'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2021/12/15/1405406409.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              "Jesica Jane",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: const Text(
              "Mahasiswa",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          const RowText(
            label: 'Mata Kuliah :',
            value: 'Nilai :',
            labelColor: ColorName.primary,
            valueColor: ColorName.primary,
          ),
          const SizedBox(height: 14.0),
          Expanded(
            child: BlocBuilder<KhsBloc, KhsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox();
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loaded: (data) {
                    int total = 0;
                    data.forEach((element) {
                      total += int.parse(element.nilai);
                    });
                    ipk = total / data.length;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: RowText(
                                  label: data[index].subject.title,
                                  value: data[index].grade.toString(),
                                ),
                              );
                            },
                            itemCount: data.length,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        RowText(
                          label: 'IPK Semester :',
                          value: ipk.toString(),
                          labelColor: ColorName.primary,
                          valueColor: ColorName.primary,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 3),
        ],
      ),
    );
  }
}
