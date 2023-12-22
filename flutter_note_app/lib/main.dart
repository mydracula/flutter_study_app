import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note_app/controller/db_controller.dart';
import 'package:flutter_note_app/pages/new_note_page.dart';
import 'package:flutter_note_app/widgets/note_card.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //设置状态栏颜色为透明
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DBController dbController = Get.put(DBController());

    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('API-NOTE'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const NewNotePage());
          },
          backgroundColor: const Color.fromRGBO(34, 150, 243, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Icon(Icons.add), // 设置按钮背景色，可按需设置。
        ),
        body: SafeArea(
            child: Obx(
          () => GridView.count(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              children: dbController.noteList.map((note) {
                return NoteCard(
                  note: note,
                );
              }).toList()),
        )),
      ),
    );
  }
}
