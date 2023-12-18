import 'dart:typed_data';

import 'package:audio_service/audio_service.dart';
import 'package:flutter_music_app/controller/audio_init_controller.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class SongDataController extends GetxController {
  // SongPlayerController songPlayerController = Get.put(SongPlayerController());
  AudioInitController audioInitController = Get.put(AudioInitController());

  final OnAudioQuery _audioQuery = OnAudioQuery();
  RxList<MediaItem> localSongList = <MediaItem>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPlayingIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    storagePermission();
  }

  Future<void> storagePermission() async {
    await Permission.storage.status.isGranted.then(
      (granted) async {
        if (granted == false) {
          PermissionStatus permissionStatus =
              await Permission.storage.request();
          if (permissionStatus == PermissionStatus.permanentlyDenied) {
            await openAppSettings();
          }
          return;
        }
        getLocalSongs();
      },
    );
  }

  Future<Uint8List?> art({required int id}) async {
    return await _audioQuery.queryArtwork(id, ArtworkType.AUDIO, quality: 100);
  }

  void getLocalSongs() async {
    List<SongModel> songs = await _audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
    List<MediaItem> items = [];

    for (SongModel song in songs) {
      if (song.isMusic == true) {
        // Retrieve artwork for the song
        Uint8List? uint8list = await art(id: song.id);
        List<int> bytes = [];
        if (uint8list != null) {
          bytes = uint8list.toList();
        }

        // add the converted song to the list of MediaItems
        items.add(
          MediaItem(
            id: song.uri!,
            title: song.title,
            artist: song.artist,
            duration: Duration(milliseconds: song.duration!),
            artUri: uint8list == null ? null : Uri.dataFromBytes(bytes),
          ),
        );
      }
    }

    audioInitController.audioHandler.initSongs(songs: items);

    localSongList.value = items;

    // await songPlayerController.player.setLoopMode(LoopMode.all);
    // await songPlayerController.player.setShuffleModeEnabled(false);
  }

  // int findCurrentSongPlayingIndex(int songId) {
  //   var index = 0;
  //   for (var e in localSongList) {
  //     if (e.id == songId) {
  //       return index;
  //     }
  //     index++;
  //   }
  //   return 0;
  // }

  // void playNextSong() async {
  //   await songPlayerController.player.seekToNext();
  //   songPlayerController.songTitle.value =
  //       localSongList[songPlayerController.player.currentIndex!].title;
  //   songPlayerController.songArtist.value =
  //       localSongList[songPlayerController.player.currentIndex!].artist!;
  //   // songPlayerController.isPlaying.value = true;
  // }

  // void playPreviousSong() async {
  //   await songPlayerController.player.seekToPrevious();
  //   songPlayerController.songTitle.value =
  //       localSongList[songPlayerController.player.currentIndex!].title;
  //   songPlayerController.songArtist.value =
  //       localSongList[songPlayerController.player.currentIndex!].artist!;
  //   // songPlayerController.isPlaying.value = true;
  // }
}
