import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/note_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DBController extends GetxController {
  final String url = 'https://657fa82e6ae0629a3f537b1c.mockapi.io/note';
  RxList<NoteModel> noteList = <NoteModel>[].obs;
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController titleDetails = TextEditingController();
  TextEditingController descDetails = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {
    var response = await http.get(Uri.parse(url));
    var notes = jsonDecode(utf8.decode(response.bodyBytes));
    noteList.clear();
    for (var note in notes) {
      noteList.add(NoteModel.fromJson(note));
    }
  }

  Future<void> addNote() async {
    var newNote = NoteModel(
        title: title.text,
        desc: desc.text,
        date: DateTime.now().toString(),
        time: '');
    if (title.text != "" && desc.text != "") {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(newNote.toJson()),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201) {
        title.clear();
        desc.clear();
        getNotes();
        Get.back();
      }
    }
  }

  Future<void> deleteNote(String id) async {
    var newUrl = 'https://657fa82e6ae0629a3f537b1c.mockapi.io/note/$id';
    final response = await http.delete(Uri.parse(newUrl));
    if (response.statusCode == 200) {
      getNotes();
      Get.back();
    }
  }

  Future<void> updateNote(String id) async {
    var newUrl = "https://657fa82e6ae0629a3f537b1c.mockapi.io/note/$id";
    var updatedNote = NoteModel(
      title: titleDetails.text,
      desc: descDetails.text,
    );
    var response = await http.put(Uri.parse(newUrl),
        body: jsonEncode(updatedNote.toJson()),
        headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      getNotes();
      Get.back();
    }
  }
}
