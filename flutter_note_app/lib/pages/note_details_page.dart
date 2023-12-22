import 'package:flutter/material.dart';
import 'package:flutter_note_app/controller/db_controller.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:get/get.dart';

class NoteDetailsPage extends StatelessWidget {
  final NoteModel note;
  const NoteDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    DBController dbController = Get.put(DBController());
    dbController.titleDetails.text = note.title.toString();
    dbController.descDetails.text = note.desc.toString();

    return Scaffold(
      appBar: AppBar(title: Text(note.title!), centerTitle: true, actions: [
        IconButton(
            onPressed: () {
              dbController.deleteNote(note.id.toString());
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ))
      ]),
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
                controller: dbController.titleDetails,
                decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            TextFormField(
                controller: dbController.descDetails,
                decoration: const InputDecoration(
                    hintText: 'Description',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  dbController.updateNote(note.id.toString());
                },
                child: const Text('UPDATE')),
          ],
        ),
      )),
    );
  }
}
