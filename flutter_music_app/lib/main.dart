import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music_app/config/theme.dart';
import 'package:flutter_music_app/controller/audio_init_controller.dart';
import 'package:flutter_music_app/pages/song_page.dart';
import 'package:get/get.dart';

// Create an instance of MyAudioHandler

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => AudioInitController());
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const Scaffold(
        body: SongPage(),
      ),
    );
  }
}
