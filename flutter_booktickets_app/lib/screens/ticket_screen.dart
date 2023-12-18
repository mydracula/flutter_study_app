import 'package:app/screens/ticket_view.dart';
import 'package:app/utils/app_styles.dart';
import 'package:app/widgets/column_layout.dart';
import 'package:app/widgets/layout_builder_widget.dart';
import 'package:app/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const Gap(40),
            Text(
              "Tickets",
              style: Styles.headLine1,
            ),
            const Gap(20),
            const TicketTabs(firstTable: 'Upcoming', secondTable: 'previous'),
            const Gap(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const FittedBox(
                  child: TicketView(
                isColored: true,
                isMargin: true,
              )),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnLayout(
                        firstText: 'Flutter DB',
                        secondText: 'Passenger',
                        alignment: CrossAxisAlignment.start),
                    ColumnLayout(
                        firstText: '5221 364869',
                        secondText: 'passport',
                        alignment: CrossAxisAlignment.end),
                  ],
                ),
                const Gap(20),
                const LayoutBuilderWidget(
                  sections: 15,
                  width: 5,
                  height: 1,
                  isColored: true,
                ),
                const Gap(20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnLayout(
                        firstText: '0055 444 77147',
                        secondText: 'Number of E-ticket',
                        alignment: CrossAxisAlignment.start),
                    ColumnLayout(
                        firstText: 'B2SG28',
                        secondText: 'Booking code',
                        alignment: CrossAxisAlignment.end),
                  ],
                ),
                const Gap(20),
                const LayoutBuilderWidget(
                  sections: 15,
                  width: 5,
                  height: 1,
                  isColored: true,
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'https://imgfg.com/i/dhVJs4wHvs.jpg',
                              scale: 10,
                            ),
                            const Gap(5),
                            Text(
                              ' *** 2462',
                              style: Styles.headLine3,
                            )
                          ],
                        ),
                        const Gap(5),
                        Text(
                          'Payment method',
                          style: Styles.headLine4,
                        )
                      ],
                    ),
                    const ColumnLayout(
                        firstText: '\$249.991',
                        secondText: 'Price',
                        alignment: CrossAxisAlignment.end)
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(21),
                      bottomLeft: Radius.circular(21))),
              margin: const EdgeInsets.only(left: 15, right: 15),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: 'https://bihexx.store/',
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70,
                    errorBuilder: (context, error) =>
                        Center(child: Text(error)),
                  ),
                ),
              ),
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const TicketView(
                isMargin: true,
              ),
            ),
          ],
        ),
        Positioned(
            left: 22,
            top: 295,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Styles.textColor),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            )),
        Positioned(
            right: 22,
            top: 295,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Styles.textColor),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ))
      ]),
    );
  }
}
