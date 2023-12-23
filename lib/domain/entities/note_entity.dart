import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final int id;
  final String title;
  final String text;
  final DateTime date;

  const NoteEntity({
    required this.title,
    required this.text,
    required this.date,
    required this.id,
  });

  @override
  List<Object?> get props => [title, text, date, id];
}
