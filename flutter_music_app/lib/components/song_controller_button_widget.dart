import 'package:flutter/material.dart';
import 'package:flutter_music_app/config/colors.dart';
import 'package:flutter_music_app/controller/audio_init_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SongControllerButtonWidget extends StatefulWidget {
  final String currentTime;
  final String totalTime;
  final double sliderMaxValue;
  final double sliderValue;

  const SongControllerButtonWidget({
    super.key,
    required this.currentTime,
    required this.totalTime,
    required this.sliderMaxValue,
    required this.sliderValue,
  });

  @override
  State<SongControllerButtonWidget> createState() =>
      _SongControllerButtonWidgetState();
}

class _SongControllerButtonWidgetState
    extends State<SongControllerButtonWidget> {
  AudioInitController audioInitController = Get.put(AudioInitController());
  String songMode = 'order';
  late double _sliderValue;
  bool dragging = false;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.sliderValue;
  }

  @override
  didUpdateWidget(SongControllerButtonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sliderValue != widget.sliderValue && dragging == false) {
      setState(() {
        _sliderValue = widget.sliderValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = audioInitController.audioHandler.audioPlayer;

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    audioInitController.formatDuration(
                        Duration(seconds: _sliderValue.toInt())),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  overlayShape: SliderComponentShape
                      .noOverlay, // Set overlay shape to remove default spacing
                ),
                child: Slider(
                  value: _sliderValue.clamp(0.0, widget.sliderMaxValue),
                  onChanged: (value) {
                    setState(() {
                      dragging = true;
                      _sliderValue = value;
                    });
                  },
                  onChangeEnd: (value) {
                    setState(() {
                      dragging = false;
                    });
                    Duration position = Duration(seconds: value.toInt());
                    audioPlayer.seek(position);
                  },
                  min: 0,
                  max: widget.sliderMaxValue,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.totalTime,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ],
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (songMode == "order") {
                  setState(() {
                    songMode = 'shuffle';
                  });
                  audioPlayer.setLoopMode(LoopMode.all);
                  audioPlayer.setShuffleModeEnabled(true);
                } else if (songMode == "shuffle") {
                  setState(() {
                    songMode = 'repeat';
                  });
                  audioPlayer.setLoopMode(LoopMode.one);
                  audioPlayer.setShuffleModeEnabled(false);
                } else if (songMode == "repeat") {
                  setState(() {
                    songMode = 'order';
                  });
                  audioPlayer.setLoopMode(LoopMode.all);
                  audioPlayer.setShuffleModeEnabled(false);
                }
              },
              child: SvgPicture.asset(
                'assets/icons/$songMode.svg',
                width: 25,
              ),
            ),
            const Gap(40),
            InkWell(
              onTap: () async {
                if (audioPlayer.loopMode == LoopMode.one) {
                  audioPlayer.setLoopMode(LoopMode.all);
                  await audioInitController.audioHandler.skipToPrevious();
                  audioPlayer.setLoopMode(LoopMode.one);
                  return;
                }
                await audioInitController.audioHandler.skipToPrevious();
              },
              child: SvgPicture.asset(
                'assets/icons/back.svg',
                width: 25,
              ),
            ),
            const Gap(40),
            InkWell(
              onTap: () {
                if (audioPlayer.playing) {
                  audioPlayer.pause();
                } else {
                  audioPlayer.play();
                }
              },
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: primaryColor, shape: BoxShape.circle
                        // shape:
                        ),
                child: Center(
                  child: SvgPicture.asset(
                    audioPlayer.playing
                        ? 'assets/icons/pause.svg'
                        : 'assets/icons/play.svg',
                    width: 25,
                  ),
                ),
              ),
            ),
            const Gap(40),
            InkWell(
              onTap: () async {
                if (audioPlayer.loopMode == LoopMode.one) {
                  audioPlayer.setLoopMode(LoopMode.all);
                  await audioInitController.audioHandler.skipToNext();
                  audioPlayer.setLoopMode(LoopMode.one);
                  return;
                }
                await audioInitController.audioHandler.skipToNext();
              },
              child: SvgPicture.asset(
                'assets/icons/next.svg',
                width: 25,
              ),
            ),
            // song_play_list.svg
            const Gap(40),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/song_play_list.svg',
                width: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
