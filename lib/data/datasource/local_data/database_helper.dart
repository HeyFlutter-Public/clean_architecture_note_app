import 'package:note_app_clean_arch/data/models/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final instance = DatabaseHelper._instance();
  static Database? db;
  static late DatabaseHelper _databaseHelper;

  DatabaseHelper._instance() {
    initDB();
    _databaseHelper = this;
  }

  factory DatabaseHelper() => instance;

  final tableName = 'note';
  final id = 'id';
  final title = 'title';
  final text = 'text';
  final date = 'date';

  Future<Database?> initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}note.db';
    db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute(''' 
        create table $tableName (
        $id integer primary key autoincrement,
        $title text not null,
        $text text not null,
        $date INTEGER not null
        ) ''');
    });
    return db;
  }

  Future<Note> add(Note note) async {
    note.id = (await db?.insert(tableName, note.toJson()))!;
    return note;
  }

  Future<List<Note>> fetch() async {
    final maps = await db!.query(tableName);

    return List.generate(maps.length, (i) {
      return Note.fromJson(Map<String, dynamic>.from(maps[i]));
    });
  }

  Future<int?> update(Note note) async {
    return await db?.update(tableName, note.toJson(),
        where: '$id = ?', whereArgs: [note.id]);
  }

  Future<int?> delete(int noteId) async {
    return await db?.delete(
      tableName,
      where: '$id = ?',
      whereArgs: [noteId],
    );
  }
}
