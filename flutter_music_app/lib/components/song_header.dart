import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SongPageHeader extends StatelessWidget {
  const SongPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/big_logo.svg",
          width: 40,
        ),
        const Gap(10),
        const Text(
          "MUSIC BAG",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
        )
      ],
    );
  }
}
