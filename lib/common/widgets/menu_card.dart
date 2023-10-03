import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MenuCard extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String imagePath;

  const MenuCard({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.onPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(32.5)),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorName.white,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorName.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Lihat'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 91,
                height: 106,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(94.25),
                  color: ColorName.white.withOpacity(0.2),
                ),
              ),
              const SizedBox(width: 8.0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imagePath,
              height: 90.0,
            ),
          ),
        ),
      ],
    );
  }
}
