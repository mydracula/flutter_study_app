import 'package:app/utils/app_layout.dart';
import 'package:app/utils/app_styles.dart';
import 'package:app/widgets/layout_builder_widget.dart';
import 'package:app/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final bool? isColored;
  final bool? isMargin;
  const TicketView({super.key, this.isColored, this.isMargin});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: isColored == null ? 200 : null,
      child: Container(
        margin: isMargin == null ? const EdgeInsets.only(right: 16) : null,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color:
                    isColored == null ? const Color(0xFF526799) : Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21))),
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    'NYC',
                    style: isColored == null
                        ? Styles.headLine3.copyWith(color: Colors.white)
                        : Styles.headLine3,
                  ),
                  Expanded(child: Container()),
                  ThickContayiner(
                    isColored: isColored,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      SizedBox(
                          height: 24,
                          child: LayoutBuilderWidget(
                              sections: 6,
                              width: 3,
                              height: 1,
                              isColored: isColored)),
                      Center(
                        child: Transform.rotate(
                          angle: 1.5,
                          child: Icon(Icons.local_airport_rounded,
                              color: isColored == null
                                  ? Colors.white
                                  : const Color(0xFF8ACCF7)),
                        ),
                      )
                    ],
                  )),
                  ThickContayiner(
                    isColored: isColored,
                  ),
                  Expanded(child: Container()),
                  Text(
                    'LDN',
                    style: isColored == null
                        ? Styles.headLine3.copyWith(color: Colors.white)
                        : Styles.headLine3,
                  )
                ],
              ),
              const Gap(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text('New-York',
                        style: isColored == null
                            ? Styles.headLine4.copyWith(color: Colors.white)
                            : Styles.headLine4),
                  ),
                  Text(
                    "8H 30M",
                    style: isColored == null
                        ? Styles.headLine4.copyWith(color: Colors.white)
                        : Styles.headLine4,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'London',
                      textAlign: TextAlign.end,
                      style: isColored == null
                          ? Styles.headLine4.copyWith(color: Colors.white)
                          : Styles.headLine4,
                    ),
                  )
                ],
              )
            ]),
          ),
          Container(
            color: isColored == null ? Styles.orangeColor : Colors.white,
            child: Row(
              children: [
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ))),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: LayoutBuilderWidget(
                          sections: 15,
                          width: 5,
                          height: 1,
                          isColored: isColored)),
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ))),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: isColored == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(isColored == null ? 21 : 0),
                    bottomRight: Radius.circular(isColored == null ? 21 : 0))),
            padding:
                const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1 May',
                          style: isColored == null
                              ? Styles.headLine3.copyWith(color: Colors.white)
                              : Styles.headLine3,
                        ),
                        const Gap(5),
                        Text(
                          'Date',
                          style: isColored == null
                              ? Styles.headLine4.copyWith(color: Colors.white)
                              : Styles.headLine4,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '08:00 AM',
                          style: isColored == null
                              ? Styles.headLine3.copyWith(color: Colors.white)
                              : Styles.headLine3,
                        ),
                        const Gap(5),
                        Text(
                          'Departure time',
                          style: isColored == null
                              ? Styles.headLine4.copyWith(color: Colors.white)
                              : Styles.headLine4,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '23',
                          style: isColored == null
                              ? Styles.headLine3.copyWith(color: Colors.white)
                              : Styles.headLine3,
                        ),
                        const Gap(5),
                        Text(
                          'Number',
                          style: isColored == null
                              ? Styles.headLine4.copyWith(color: Colors.white)
                              : Styles.headLine4,
                        )
                      ],
                    ),
                  ],
                ),
                const Row(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
