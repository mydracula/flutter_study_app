import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/song_controller_button_widget.dart';
import 'package:flutter_music_app/controller/audio_init_controller.dart';
import 'package:get/get.dart';

class SongControllerButton extends StatelessWidget {
  const SongControllerButton({super.key});

  @override
  Widget build(BuildContext context) {
    AudioInitController audioInitController = Get.find<AudioInitController>();

    return StreamBuilder<Duration>(
      stream: AudioService.position,
      builder: (context, positionSnapshot) {
        if (positionSnapshot.data != null) {
          MediaItem item = audioInitController.audioHandler.mediaItem.value!;

          return SongControllerButtonWidget(
            currentTime:
                audioInitController.formatDuration(positionSnapshot.data!),
            totalTime: audioInitController.formatDuration(item.duration!),
            sliderMaxValue: item.duration!.inSeconds.toDouble(),
            sliderValue: positionSnapshot.data!.inSeconds.toDouble(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
