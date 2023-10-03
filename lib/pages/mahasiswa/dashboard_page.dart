import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';
import '../../common/widgets/menu_card.dart';
import '../../common/widgets/search_input.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Perkuliahan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorName.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: ColorName.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        SearchInput(
          controller: searchController,
        ),
        const SizedBox(height: 40.0),
        MenuCard(
          label: 'Kartu Hasil\nStudi',
          backgroundColor: const Color(0xff686BFF),
          onPressed: () {},
          imagePath: Images.khs,
        ),
        const SizedBox(height: 40.0),
        MenuCard(
          label: 'Nilai\nMata Kuliah',
          backgroundColor: const Color(0xffFFB023),
          onPressed: () {},
          imagePath: Images.nMatkul,
        ),
        const SizedBox(height: 40.0),
        MenuCard(
          label: 'Jadwal\nMata Kuliah',
          backgroundColor: const Color(0xffFF68F0),
          onPressed: () {},
          imagePath: Images.jadwal,
        ),
      ],
    );
  }
}
