import 'package:app/utils/app_layout.dart';
import 'package:app/utils/app_styles.dart';
import 'package:app/widgets/double_text_widget.dart';
import 'package:app/widgets/icon_text_widget.dart';
import 'package:app/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          Text("What are\nyou looking for?",
              style: Styles.headLine1.copyWith(fontSize: 35)),
          const Gap(40),
          const TicketTabs(
            firstTable: 'Airline tickets',
            secondTable: 'Hotels',
          ),
          const Gap(25),
          const IconTextWidget(
            icon: Icons.flight_takeoff_rounded,
            text: 'Departure',
          ),
          const Gap(20),
          const IconTextWidget(
            icon: Icons.flight_land_rounded,
            text: 'Arrival',
          ),
          const Gap(25),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xD91130CE)),
            child: Center(
                child: Text(
              'Find tickets',
              style: Styles.textStyle.copyWith(color: Colors.white),
            )),
          ),
          const Gap(40),
          const DoubleTextWidget(bigText: 'Upcoming Flights'),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 425,
                width: size.width * .42,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://imgfg.com/i/X2rErPE9EO.png'))),
                    ),
                    const Gap(12),
                    Text(
                      "20% discount on the early booking of this flight. Don't miss.",
                      style: Styles.headLine2,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * .44,
                        height: 200,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3AB8B8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discount\nfor survey',
                                style: Styles.headLine2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Gap(10),
                              Text(
                                'Take the survey about our services and get discount',
                                style: Styles.headLine2.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ]),
                      ),
                      Positioned(
                          right: -45,
                          top: -40,
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 18, color: const Color(0xFF189999)),
                              color: Colors.transparent,
                            ),
                            // child: ,
                          ))
                    ],
                  ),
                  const Gap(15),
                  Container(
                    width: size.width * .44,
                    height: 210,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(children: [
                      Text(
                        "Take love",
                        style: Styles.headLine2.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(5),
                      // RichText -> TextSpan
                      const FittedBox(
                        child: Row(
                          children: [
                            Text(
                              '😍',
                              style: TextStyle(fontSize: 32),
                            ),
                            Text(
                              '😋',
                              style: TextStyle(fontSize: 47),
                            ),
                            Text(
                              '😘',
                              style: TextStyle(fontSize: 32),
                            ),
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
