import 'package:app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;

  const ColumnLayout(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: alignment,
      children: [
        Text(
          firstText,
          style: Styles.headLine3,
        ),
        const Gap(5),
        Text(
          secondText,
          style: Styles.headLine4,
        ),
      ],
    );
  }
}
