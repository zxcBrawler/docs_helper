import 'package:docs_helper/feature/data/model/directory.dart';

abstract class FileState {
  final DirectoryNode? directoryNode;
  final String? error;
  const FileState({this.error, this.directoryNode});
}

class FileInitial extends FileState {
  const FileInitial();
}

class FileLoading extends FileState {
  const FileLoading();
}

class FileError extends FileState {
  const FileError(String error) : super(error: error);
}

class DirectoryTreeBuildDone extends FileState {
  const DirectoryTreeBuildDone(DirectoryNode directoryNode)
      : super(directoryNode: directoryNode);
}
