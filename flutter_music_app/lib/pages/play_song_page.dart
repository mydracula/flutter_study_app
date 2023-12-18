import 'package:flutter/material.dart';
import 'package:flutter_music_app/components/song_controller_button.dart';
import 'package:flutter_music_app/components/pay_song_header_button.dart';
import 'package:flutter_music_app/components/song_and_valume.dart';
import 'package:gap/gap.dart';

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              PlaySongHeaderButton(),
              SongAndValume(),
              Gap(20),
              // SongDetails(),
              Gap(10),
              // SongWave(),
              Spacer(),
              SongControllerButton(),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
