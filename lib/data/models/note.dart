import 'package:equatable/equatable.dart';
import 'package:note_app_clean_arch/domain/entities/note_entity.dart';

class Note extends Equatable {
  int id;
  final String title;
  final String text;
  final DateTime date;

  Note({
    required this.id,
    required this.title,
    required this.text,
    required this.date,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        text: json['text'],
        date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'text': text,
        'date': date.millisecondsSinceEpoch,
      };

  factory Note.fromEntity(NoteEntity entity) {
    return Note(
      id: entity.id,
      title: entity.title,
      text: entity.text,
      date: entity.date,
    );
  }

  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      title: title,
      text: text,
      date: date,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        text,
        date,
      ];
}
