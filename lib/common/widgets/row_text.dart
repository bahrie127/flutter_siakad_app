import 'package:flutter/material.dart';

import '../constants/colors.dart';



class RowText extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;
  final Widget? valueWidget;
  final Widget? icon;
  final VoidCallback? onTap;

  const RowText({
    super.key,
    required this.label,
    required this.value,
    this.labelColor = ColorName.grey,
    this.valueColor = ColorName.black,
    this.valueWidget,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: icon!,
                ),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: labelColor,
            ),
          ),
          const Spacer(),
          valueWidget != null
              ? valueWidget!
              : Text(
                  value,
                  style: TextStyle(
                    color: valueColor,
                  ),
                ),
        ],
      ),
    );
  }
}
