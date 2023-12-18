import 'package:app/screens/hotel_screen.dart';
import 'package:app/screens/ticket_view.dart';
import 'package:app/utils/app_info_list.dart';
import 'package:app/utils/app_styles.dart';
import 'package:app/widgets/double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeSCreen extends StatelessWidget {
  const HomeSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good morning',
                          style: Styles.headLine3
                              .copyWith(color: Colors.grey.shade500)),
                      const Gap(5),
                      Text(
                        'Book Tickets',
                        style: Styles.headLine1,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 50,
                    height: 50,
                    child: const FlutterLogo(
                      size: 200, // 设置标志的大小
                      textColor: Colors.blueGrey, // 设置标志的颜色
                      style: FlutterLogoStyle.stacked, // 设置标志的样式
                    ),
                  )
                ],
              ),
              const Gap(25),
              Container(
                // color: Color,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFf4F6FD)),
                child: Row(
                  children: [
                    const Icon(FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205)),
                    Text(
                      "search",
                      style: Styles.headLine4,
                    )
                  ],
                ),
              ),
              const Gap(40),
              const DoubleTextWidget(bigText: 'Upcoming Flights')
            ]),
          ),
          const Gap(15),
          const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                TicketView(),
                TicketView(
                  isMargin: true,
                ),
              ],
            ),
          ),
          const Gap(15),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const DoubleTextWidget(bigText: 'Hotels')),
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Row(
                children: hotelList.map((singleHotel) {
                  return HotelScreen(hotel: singleHotel);
                }).toList(),
              )),
        ],
      ),
    );
  }
}
