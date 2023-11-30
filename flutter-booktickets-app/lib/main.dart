import 'package:app/screens/bottom_bar.dart';
import 'package:app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(primaryColor: primary),
      home: const BottomBar(),
    );
  }
}
