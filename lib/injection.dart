import 'package:get_it/get_it.dart';
import 'package:note_app_clean_arch/data/datasource/note_local_datasource.dart';
import 'package:note_app_clean_arch/data/repositories/note_repository_impl.dart';
import 'package:note_app_clean_arch/presentation/bloc/note_bloc.dart';

import 'domain/repositories/note_repo.dart';
import 'domain/usecases/note_usecases.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(() => NoteBloc(
        locator<FetchNote>(),
        locator<AddNote>(),
      ));

  locator.registerLazySingleton(() => FetchNote(locator()));
  locator.registerLazySingleton(() => AddNote(locator()));

  locator.registerLazySingleton<NoteRepository>(
    () => NoteRepositoryImpl(noteLocalDataSource: locator()),
  );

  locator.registerLazySingleton<NoteLocalDataSource>(
    () => NoteLocalDataSourceImpl(),
  );
}
