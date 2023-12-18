import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return const Column(
      children: [
        // Row(
        //   children: [
        //     SvgPicture.asset('assets/icons/play_outline.svg'),
        //     const Gap(10),
        //     Text(
        //       '210 Plays',
        //       style: Theme.of(context).textTheme.bodySmall,
        //     ),
        //   ],
        // ),
        // const Gap(10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Flexible(
        //         child: Obx(() => Text(
        //               songPlayerController.songTitle.value,
        //               maxLines: 1,
        //               style: Theme.of(context).textTheme.bodyLarge,
        //             ))),
        //     const Spacer(),
        //     SvgPicture.asset(
        //       'assets/icons/heart.svg',
        //       width: 25,
        //     ),
        //     const Gap(20),
        //     SvgPicture.asset(
        //       'assets/icons/download.svg',
        //       width: 25,
        //     ),
        //   ],
        // ),
        Gap(10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Obx(() => Text(
        //           songPlayerController.songArtist.value,
        //           style: Theme.of(context).textTheme.bodySmall,
        //         )),
        //   ],
        // ),
      ],
    );
  }
}
