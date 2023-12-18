import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/config/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class TrendingSogSlider extends StatelessWidget {
  const TrendingSogSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> sliderItem = [
      Container(
        padding: const EdgeInsets.all(20),
        height: 300,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage('https://imgfg.com/i/QxZaEdhKK0.png'),
              fit: BoxFit.cover),
          color: divColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: divColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/music_node.svg'),
                        const Gap(10),
                        Text(
                          "Tranding",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: fontColor),
                        )
                      ],
                    ),
                  )
                ]),
              ],
            ),
            Expanded(child: Container()),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DJ WALA BABU',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BADASAH',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: lableColor),
                ),
              ],
            )
          ],
        ),
      )
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
      items: sliderItem,
    );
  }
}
