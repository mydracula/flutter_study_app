import 'package:flutter_music_app/controller/song_data_controller.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  static late ConcatenatingAudioSource songPlayList;
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = '0:00:00'.obs;
  RxString totalTime = '0:00:00'.obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  RxString songMode = "order".obs;

  void playLocalAudio(SongModel song) async {
    // songTitle.value = song.title;
    // songArtist.value = song.artist!;
    // SongDataController songDataController = Get.put(SongDataController());
    // int initialIndex =
    //     songDataController.localSongList.indexWhere((s) => s.id == song.id);
    // await player.setAudioSource(songPlayList,
    //     initialIndex: initialIndex, initialPosition: Duration.zero);
    // isPlaying.value = true;
    // updatePosition();
    // player.play();
  }

  void pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  void updatePosition() {
    player.durationStream.listen((d) {
      if (d != null) {
        totalTime.value = d.toString().split(".")[0];
        sliderMaxValue.value = d.inSeconds.toDouble();
      }
    });
    player.positionStream.listen((p) {
      currentTime.value = p.toString().split(".")[0];
      sliderValue.value = p.inSeconds.toDouble();
      if (totalTime.value == currentTime.value) {
        isPlaying.value = false;
      }
    });

    player.currentIndexStream.listen((index) {
      isPlaying.value = true;
      SongDataController songDataController = Get.put(SongDataController());
      songTitle.value = songDataController.localSongList[index!].title;
      songArtist.value = songDataController.localSongList[index].artist!;
    });
  }

  void changeSongSider(Duration position) {
    player.seek(position);
  }

  void setLoopSong() async {
    await player.setLoopMode(LoopMode.one);
  }

  void setSongMode() async {
    if (songMode.value == "order") {
      songMode.value = 'shuffle';
      await player.setLoopMode(LoopMode.all);
      await player.setShuffleModeEnabled(true);
    } else if (songMode.value == "shuffle") {
      songMode.value = 'repeat';
      await player.setShuffleModeEnabled(false);
      await player.setLoopMode(LoopMode.one);
    } else if (songMode.value == "repeat") {
      songMode.value = 'order';
      await player.setShuffleModeEnabled(false);
      await player.setLoopMode(LoopMode.all);
    }
  }
}
