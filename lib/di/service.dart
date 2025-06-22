import 'package:docs_helper/feature/domain/clipboard_service/clipboard_repository.dart';
import 'package:docs_helper/feature/domain/clipboard_service/clipboard_repository_impl.dart';
import 'package:docs_helper/feature/domain/export_service/export_repository.dart';
import 'package:docs_helper/feature/domain/export_service/export_repository_impl.dart';
import 'package:docs_helper/feature/domain/pick_folder_service/pick_folder_repository.dart';
import 'package:docs_helper/feature/domain/pick_folder_service/pick_folder_repository_impl.dart';
import 'package:docs_helper/feature/domain/usecase/copy_to_clipboard_usecase.dart';
import 'package:docs_helper/feature/domain/usecase/pick_folder_usecase.dart';
import 'package:docs_helper/feature/presentation/bloc/clipboard/clipboard_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_bloc.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;
Future<void> initDependencies() async {
  // bloc
  service.registerFactory<FileBloc>(() => FileBloc(service()));
  service.registerFactory<ClipboardBloc>(() => ClipboardBloc(service()));
  service.registerFactory<ExportBloc>(() => ExportBloc());

  // repo
  service.registerSingleton<PickFolderRepository>(PickFolderRepositoryImpl());
  service.registerSingleton<ClipboardRepository>(ClipboardRepositoryImpl());
  service.registerSingleton<ExportRepository>(ExportRepositoryImpl());

  // usecase
  service.registerSingleton<PickFolderUsecase>(PickFolderUsecase(service()));
  service.registerSingleton<CopyToClipboardUsecase>(
      CopyToClipboardUsecase(service()));
}
