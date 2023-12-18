import 'package:app/utils/app_styles.dart';
import 'package:app/widgets/column_layout.dart';
import 'package:app/widgets/layout_builder_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://imgfg.com/i/gU9UqhjzAj.jpg'))),
              ),
              const Gap(40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Book Tickets',
                    style: Styles.headLine1,
                  ),
                  const Gap(2),
                  Text(
                    'New-York',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500),
                  ),
                  const Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFEF4F3),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF526799),
                          ),
                          child: const Icon(
                            FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        const Gap(5),
                        const Text(
                          'Premium status',
                          style: TextStyle(
                              color: Color(0xFF526799),
                              fontWeight: FontWeight.w600),
                        ),
                        const Gap(5),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Eidt',
                      style: Styles.textStyle.copyWith(
                          color: Styles.primaryColor,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              )
            ],
          ),
          const Gap(8),
          Divider(
            color: Colors.grey.shade300,
          ),
          const Gap(8),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                    color: Styles.primaryColor,
                    borderRadius: BorderRadius.circular(18)),
              ),
              Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 18, color: const Color(0xFF264CD2))),
                  )),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        color: Styles.primaryColor,
                        size: 27,
                      ),
                    ),
                    const Gap(12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You\'v got a new award',
                          style: Styles.headLine2.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          'You have 95 flights in a year',
                          style: Styles.headLine2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Gap(25),
          Text(
            'Accumulated miles',
            style: Styles.headLine2,
          ),
          const Gap(20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Styles.bgColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1)
                ]),
            child: Column(children: [
              const Gap(15),
              Text(
                '192802',
                style: TextStyle(
                    fontSize: 45,
                    color: Styles.textColor,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Miles accrued',
                    style: Styles.headLine4.copyWith(fontSize: 16),
                  ),
                  Text(
                    '11 June 2022',
                    style: Styles.headLine4.copyWith(fontSize: 16),
                  )
                ],
              ),
              const Gap(4),
              Divider(
                color: Colors.grey.shade300,
              ),
              const Gap(4),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColumnLayout(
                    firstText: '23 042',
                    secondText: 'Miles',
                    alignment: CrossAxisAlignment.start,
                  ),
                  ColumnLayout(
                    firstText: 'Airline CO',
                    secondText: 'Received from',
                    alignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
              const Gap(12),
              const LayoutBuilderWidget(
                sections: 12,
                isColored: true,
              ),
              const Gap(12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColumnLayout(
                    firstText: '24',
                    secondText: 'Miles',
                    alignment: CrossAxisAlignment.start,
                  ),
                  ColumnLayout(
                    firstText: 'McDonal\'s',
                    secondText: 'Received from',
                    alignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
              const Gap(12),
              const LayoutBuilderWidget(
                sections: 12,
                isColored: true,
              ),
              const Gap(12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColumnLayout(
                    firstText: '52 340',
                    secondText: 'Miles',
                    alignment: CrossAxisAlignment.start,
                  ),
                  ColumnLayout(
                    firstText: 'EXUMA',
                    secondText: 'Received from',
                    alignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
            ]),
          ),
          const Gap(25),
          InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                'How to get more miles',
                style: Styles.textStyle.copyWith(
                    color: Styles.primaryColor, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
