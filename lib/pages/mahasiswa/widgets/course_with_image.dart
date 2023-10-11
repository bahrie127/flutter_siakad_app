import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';



class CourseWithImage extends StatelessWidget {
  final String name;
  final String imagePath;

  const CourseWithImage({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          height: 112.0,
          width: 96.0,
          fit: BoxFit.cover,
        ),
        Container(
          height: 112.0,
          width: 96.0,
          padding: const EdgeInsets.only(bottom: 20.0),
          alignment: Alignment.bottomCenter,
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: ColorName.white,
            ),
          ),
        ),
      ],
    );
  }
}
