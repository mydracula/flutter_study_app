import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/song_header.dart';
import 'package:flutter_music_app/components/song_tile.dart';
import 'package:flutter_music_app/components/trending_sog_lider.dart';
import 'package:flutter_music_app/config/colors.dart';
import 'package:flutter_music_app/controller/audio_init_controller.dart';
import 'package:flutter_music_app/controller/song_data_controller.dart';
import 'package:flutter_music_app/pages/play_song_page.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    AudioInitController audioInitController = Get.put(AudioInitController());
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Gap(20),
              const SongPageHeader(),
              const Gap(20),
              const TrendingSogSlider(),
              const Gap(20),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // songDataController.isDeviceSong.value = false;
                        },
                        child: Text(
                          'Cloud Song',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: songDataController.isDeviceSong.value
                                      ? primaryColor
                                      : lableColor),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Device Song',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: songDataController.isDeviceSong.value
                                      ? lableColor
                                      : primaryColor),
                        ),
                      )
                    ],
                  )),
              const Gap(20),
              Obx(
                () => Column(
                  children: songDataController.localSongList.map((e) {
                    return SongTile(
                      songName: e.title,
                      onPressed: () {
                        MediaItem item =
                            audioInitController.audioHandler.mediaItem.value!;
                        int index = songDataController.localSongList
                            .indexWhere((song) => song == e);
                        bool isPlaying = audioInitController
                            .audioHandler.audioPlayer.playing;
                        if (e != item || (index == 0 && !isPlaying)) {
                          audioInitController.audioHandler
                              .skipToQueueItem(index);
                        }
                        // print(
                        //     '啊${audioInitController.audioHandler.playbackState.stream.value}');
                        Get.to(
                          () => const PlaySongPage(),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 200),
                        );
                      },
                    );
                  }).toList(),
                ),
              )
              // const SongTile(),
              // const SongTile(),
              // const SongTile(),
              // const SongTile(),
            ],
          ),
        ),
      )),
    );
  }
}
