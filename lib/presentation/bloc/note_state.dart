part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteEmptyState extends NoteState {}

class FetchNoteState extends NoteState {
  final List<NoteEntity> notes;

  const FetchNoteState({required this.notes});
  @override
  List<Object> get props => [];
}

class AddNoteState extends NoteState {
  final NoteEntity note;

  const AddNoteState(this.note);

  @override
  List<Object> get props => [note];
}

class LoadingNoteState extends NoteState {}

class LoadedNoteAfterAddingState extends NoteState {
  final List<NoteEntity> notes;

  const LoadedNoteAfterAddingState(this.notes);

  @override
  List<Object> get props => [notes];
}

class NoteLoadedState extends NoteState {
  final List<NoteEntity> notes;

  const NoteLoadedState(this.notes);

  @override
  List<Object> get props => [notes];
}

class NoteErrorState extends NoteState {
  final String message;

  const NoteErrorState(this.message);

  @override
  List<Object> get props => [message];
}
