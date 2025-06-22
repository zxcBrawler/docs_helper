abstract class ExportState {
  final Set<String>? selectedExtensions;
  final bool isExporting;
  final String? error;
  const ExportState(
      {this.selectedExtensions, this.error, this.isExporting = false});
}

class ExportInitial extends ExportState {
  const ExportInitial()
      : super(isExporting: false, selectedExtensions: const {});
}

class ExportCancelled extends ExportState {
  const ExportCancelled();
}

class ExportExtensionsUpdated extends ExportState {
  const ExportExtensionsUpdated(Set<String> selectedExtensions)
      : super(selectedExtensions: selectedExtensions);
}

class ExportInProgress extends ExportState {
  const ExportInProgress() : super(isExporting: true);
}

class ExportSuccess extends ExportState {
  final int fileCount;
  final String exportPath;

  const ExportSuccess(this.fileCount, this.exportPath);
}

class ExportError extends ExportState {
  const ExportError(String error) : super(error: error);
}
