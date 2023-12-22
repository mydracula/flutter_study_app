import 'package:flutter/material.dart';
import 'package:flutter_note_app/controller/db_controller.dart';
import 'package:get/get.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    DBController dbController = Get.put(DBController());
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(142, 188, 248, 1),
      appBar: AppBar(
        title: const Text('NEW-NOTE'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: dbController.title,
                decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            TextFormField(
                controller: dbController.desc,
                decoration: const InputDecoration(
                    hintText: 'Description',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  dbController.addNote();
                },
                child: const Text('SAVE')),
          ],
        ),
      )),
    );
  }
}
