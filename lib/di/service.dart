import 'package:docs_helper/feature/domain/pick_folder_service/pick_folder_repository.dart';
import 'package:docs_helper/feature/domain/pick_folder_service/pick_folder_repository_impl.dart';
import 'package:docs_helper/feature/domain/usecase/pick_folder_usecase.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_bloc.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;
Future<void> initDependencies() async {
  // bloc
  service.registerFactory<FileBloc>(() => FileBloc(service()));

  // repo
  service.registerSingleton<PickFolderRepository>(PickFolderRepositoryImpl());

  // usecase
  service.registerSingleton<PickFolderUsecase>(PickFolderUsecase(service()));
}
