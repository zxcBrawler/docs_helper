import 'package:docs_helper/feature/data/model/directory.dart';

abstract class ExportEvent {
  final dynamic param;
  const ExportEvent({this.param});
}

class ToggleExtensionSelection extends ExportEvent {
  final String extension;

  ToggleExtensionSelection(this.extension);
}

class ExportFilesByExtensions extends ExportEvent {
  final DirectoryNode rootDirectory;
  final Set<String> extensions;

  ExportFilesByExtensions(this.rootDirectory, this.extensions);
}

class ClearSelection extends ExportEvent {}
