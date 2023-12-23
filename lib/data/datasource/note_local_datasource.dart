import 'package:note_app_clean_arch/data/models/note.dart';

import 'local_data/database_helper.dart';

abstract class NoteLocalDataSource {
  Future<List<Note>> fetch();
  Future<Note> add(Note note);
  Future<int?> delete(int noteId);
  Future<int?> update(Note note);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  Future<Note> add(Note note) => _databaseHelper.add(note);

  @override
  Future<List<Note>> fetch() => _databaseHelper.fetch();

  @override
  Future<int?> update(Note note) => _databaseHelper.update(note);

  @override
  Future<int?> delete(int noteId) => _databaseHelper.delete(noteId);
}
