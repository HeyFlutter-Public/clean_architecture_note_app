import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_clean_arch/domain/usecases/note_usecases.dart';

import '../../domain/entities/note_entity.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final FetchNote fetchNotes;
  final AddNote addNotes;

  NoteBloc(this.fetchNotes, this.addNotes) : super(NoteEmptyState()) {
    on<FetchNotes>(fetchNote);
    on<AddNoteEvent>(addNote);
    on<FetchNotesAfterAddingEvent>(fetchNotesAfterAdding);
  }

  FutureOr<void> fetchNote(event, emit) async {
    // emit(LoadingNoteState());

    try {
      final result = await fetchNotes.execute();

      result.fold(
        (failure) => emit(NoteErrorState(failure.message)),
        (notes) {
          if (notes.isEmpty) {
            emit(NoteEmptyState());
          } else {
            emit(NoteLoadedState(notes));
          }
        },
      );
    } catch (e) {
      emit(NoteErrorState('Error loading notes: $e'));
    }
  }

  Future<void> fetchNotesAfterAdding(event, emit) async {
    try {
      final result = await fetchNotes.execute();

      result.fold(
        (failure) => emit(NoteErrorState(failure.message)),
        (notes) {
          if (notes.isEmpty) {
            emit(NoteEmptyState());
          } else {
            emit(LoadedNoteAfterAddingState(notes));
          }
        },
      );
    } catch (e) {
      emit(NoteErrorState('Error loading notes: $e'));
    }
  }

  Future<void> addNote(event, emit) async {
    try {
      final result = await addNotes.execute(event.note);

      result.fold(
        (failure) => emit(NoteErrorState(failure.message)),
        (note) => add(FetchNotesAfterAddingEvent()),
      );
    } catch (e) {
      emit(NoteErrorState('Failed to add the note to the database: $e'));
    }
  }
}
