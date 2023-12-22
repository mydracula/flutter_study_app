class NoteModel {
  String? title;
  String? desc;
  String? date;
  String? time;
  String? id;

  NoteModel({
    this.title,
    this.desc,
    this.date,
    this.time,
    this.id,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        title: json['title'],
        desc: json['desc'],
        date: json['date'],
        time: json['time'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'date': date,
        'time': time,
        'id': id,
      };
}
