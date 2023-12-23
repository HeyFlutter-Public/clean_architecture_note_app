import 'package:dartz/dartz.dart';
import 'package:note_app_clean_arch/domain/entities/note_entity.dart';

import '../failures/failures.dart';

abstract class NoteRepository {
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note);
  Future<Either<Failure, List<NoteEntity>>> fetchNotes();
}
