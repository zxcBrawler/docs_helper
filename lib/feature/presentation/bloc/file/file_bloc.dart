import 'package:docs_helper/feature/domain/usecase/pick_folder_usecase.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_event.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final PickFolderUsecase _pickFolderUsecase;
  FileBloc(this._pickFolderUsecase) : super(const FileInitial()) {
    on<PickFolderEvent>(_onPickFolder);
    on<ToggleDirectoryExpansionEvent>(_onToggleDirectoryExpansion);
  }

  Future<void> _onPickFolder(
    PickFolderEvent event,
    Emitter<FileState> emit,
  ) async {
    try {
      emit(const FileLoading());

      String? folderPath = await FilePicker.platform.getDirectoryPath();

      if (folderPath != null) {
        final rootNode = await _pickFolderUsecase.call(params: folderPath);
        emit(DirectoryTreeBuildDone(rootNode));
      } else {
        emit(const FileError('No folder selected'));
      }
    } catch (e) {
      emit(FileError('Error picking folder: $e'));
    }
  }

  void _onToggleDirectoryExpansion(
    ToggleDirectoryExpansionEvent event,
    Emitter<FileState> emit,
  ) {
    if (state is! DirectoryTreeBuildDone || state.directoryNode == null) return;

    final newRoot = state.directoryNode!.deepCopy();

    final nodeToUpdate = newRoot.findNode(event.directoryNode.path);
    if (nodeToUpdate == null) return;

    nodeToUpdate.isExpanded = !nodeToUpdate.isExpanded;
    nodeToUpdate.children = nodeToUpdate.sortedChildren;

    emit(DirectoryTreeBuildDone(newRoot));
  }
}
