import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/config/colors.dart';
import 'package:flutter_music_app/controller/audio_init_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PlaySongHeaderButton extends StatelessWidget {
  const PlaySongHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    AudioInitController audioInitController = Get.put(AudioInitController());
    return Row(children: [
      InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: divColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: SvgPicture.asset('assets/icons/back_page.svg'),
          ),
        ),
      ),
      const Gap(30),
      Expanded(
        child: StreamBuilder<MediaItem?>(
          stream: audioInitController.audioHandler.mediaItem,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              MediaItem item = snapshot.data!;
              return Column(mainAxisSize: MainAxisSize.max, children: [
                Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  item.artist!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ]);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      const Gap(30),
      Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: divColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: SvgPicture.asset('assets/icons/setting.svg'),
        ),
      )
    ]);
  }
}
