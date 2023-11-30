import 'package:app/utils/app_layout.dart';
import 'package:app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 5,
            )
          ]),
      child: Column(children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(hotel['image']),
                fit: BoxFit.cover,
              )),
        ),
        const Gap(10),
        Text(
          hotel['place'],
          style: Styles.headLine2.copyWith(color: Styles.kakiColor),
        ),
        Text(
          hotel['destination'],
          style: Styles.headLine3.copyWith(color: Colors.white),
        ),
        const Gap(8),
        Text(
          "\$${hotel['price']}/night",
          style: Styles.headLine1.copyWith(color: Styles.kakiColor),
        ),
      ]),
    );
  }
}
