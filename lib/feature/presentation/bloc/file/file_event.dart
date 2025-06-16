import 'package:docs_helper/feature/data/model/directory.dart';

abstract class FileEvent {
  final dynamic param;
  const FileEvent({this.param});
}

class PickFolderEvent extends FileEvent {
  const PickFolderEvent();
}

class ToggleDirectoryExpansionEvent extends FileEvent {
  final DirectoryNode directoryNode;
  const ToggleDirectoryExpansionEvent(this.directoryNode);
}

class ShowFileContentEvent extends FileEvent {
  final DirectoryNode node;
  const ShowFileContentEvent(this.node);
}
