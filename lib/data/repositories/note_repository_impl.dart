import 'package:dartz/dartz.dart';
import 'package:note_app_clean_arch/data/datasource/note_local_datasource.dart';
import 'package:note_app_clean_arch/data/models/note.dart';
import 'package:note_app_clean_arch/domain/entities/note_entity.dart';
import 'package:note_app_clean_arch/domain/failures/failures.dart';

import '../../domain/exceptions/exceptions.dart';
import '../../domain/repositories/note_repo.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  NoteRepositoryImpl({required this.noteLocalDataSource});

  @override
  Future<Either<Failure, List<NoteEntity>>> fetchNotes() async {
    try {
      final notes = await noteLocalDataSource.fetch();
      return Right(notes.map((note) => note.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> addNote(note) async {
    try {
      final noteToInsert = Note.fromEntity(note);
      await noteLocalDataSource.add(noteToInsert);
      return Right(note);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
