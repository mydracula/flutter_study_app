import 'package:app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DoubleTextWidget extends StatelessWidget {
  final String bigText;
  final String smallText;
  const DoubleTextWidget(
      {super.key, required this.bigText, this.smallText = "View all"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: Styles.headLine2,
        ),
        InkWell(
            onTap: () {},
            child: Text(
              smallText,
              style: Styles.textStyle.copyWith(color: Styles.primaryColor),
            ))
      ],
    );
  }
}
