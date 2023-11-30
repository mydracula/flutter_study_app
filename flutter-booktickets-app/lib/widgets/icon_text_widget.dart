import 'package:app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(children: [
        Icon(
          icon,
          color: const Color(0xFFBFC2DF),
        ),
        const Gap(10),
        Text(
          text,
          style: Styles.textStyle,
        )
      ]),
    );
  }
}
