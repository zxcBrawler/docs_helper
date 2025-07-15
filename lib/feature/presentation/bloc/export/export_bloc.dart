import 'dart:async';

import 'package:docs_helper/feature/data/dto/create_document_dto.dart';
import 'package:docs_helper/feature/domain/usecase/create_document_usecase.dart';
import 'package:docs_helper/feature/domain/usecase/create_pdf_usecase.dart';
import 'package:docs_helper/feature/domain/usecase/find_code_files_usecase.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_event.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

class ExportBloc extends Bloc<ExportEvent, ExportState> {
  final CreatePdfUsecase _createPdfUsecase;
  final FindCodeFilesUsecase _findCodeFilesUsecase;
  final CreateDocumentUsecase _createDocumentUsecase;
  Timer? _resetTimer;
  ExportBloc(this._createPdfUsecase, this._findCodeFilesUsecase,
      this._createDocumentUsecase)
      : super(const ExportInitial()) {
    on<ExportFilesByExtensions>(_onExportFilesByExtensions);
    on<ToggleExtensionSelection>(_onToggleExtensionSelection);
    on<ClearSelection>(_onClearSelection);
  }

  void _onClearSelection(
    ClearSelection event,
    Emitter<ExportState> emit,
  ) {
    emit(const ExportInitial());
  }

  void _onToggleExtensionSelection(
    ToggleExtensionSelection event,
    Emitter<ExportState> emit,
  ) {
    final selectedExtensions = state.selectedExtensions ?? {};
    final newExtensions = Set<String>.from(selectedExtensions);

    if (newExtensions.contains(event.extension)) {
      newExtensions.remove(event.extension);
    } else {
      newExtensions.add(event.extension);
    }

    emit(ExportExtensionsUpdated(newExtensions));
  }

  Future<void> _onExportFilesByExtensions(
    ExportFilesByExtensions event,
    Emitter<ExportState> emit,
  ) async {
    try {
      emit(ExportInProgress(event.extensions));
      final savePath = await _getSavePath();
      if (savePath == null) {
        emit(const ExportError('No save path selected'));
        return;
      }

      final codeFiles = await _findCodeFilesUsecase
          .call(params: {event.rootDirectory: event.extensions});

      if (codeFiles.isEmpty) {
        emit(const ExportError('No matching code files found'));
        return;
      }

      final pdfFile =
          await _createPdfUsecase.call(params: {codeFiles: savePath});

      final CreateDocumentDto createDocumentDto = CreateDocumentDto();
      createDocumentDto.name =
          pdfFile.path.split('\\').last.replaceAll('.pdf', '');
      createDocumentDto.exportPath = savePath;
      createDocumentDto.projectFiles = codeFiles;
      createDocumentDto.projectType = "";

      await _createDocumentUsecase.call(params: createDocumentDto);
      OpenFile.open(pdfFile.path);
      emit(ExportSuccess(codeFiles.length, savePath));

      _resetTimer?.cancel();
      _resetTimer =
          Timer(const Duration(seconds: 2), () => add(ClearSelection()));
    } catch (e) {
      emit(ExportError('PDF export failed: ${e.toString()}'));
    }
  }

  Future<String?> _getSavePath() async {
    final savePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save PDF Export',
      fileName: 'code_export_${DateTime.now().millisecondsSinceEpoch}.pdf',
      allowedExtensions: ['pdf'],
    );
    return savePath;
  }

  @override
  Future<void> close() {
    _resetTimer?.cancel();
    return super.close();
  }
}
