import 'package:dartz/dartz.dart';
import 'package:note_app_clean_arch/domain/entities/note_entity.dart';
import 'package:note_app_clean_arch/domain/failures/failures.dart';

import '../repositories/note_repo.dart';

class FetchNote {
  final NoteRepository repository;
  FetchNote(this.repository);
  Future<Either<Failure, List<NoteEntity>>> execute() =>
      repository.fetchNotes();
}

class AddNote {
  final NoteRepository repository;
  AddNote(this.repository);
  Future<Either<Failure, NoteEntity>> execute(NoteEntity note) =>
      repository.addNote(note);
}
