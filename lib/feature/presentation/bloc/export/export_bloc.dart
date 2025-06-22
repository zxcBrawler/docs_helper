import 'dart:io';

import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_event.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:path/path.dart' as p;
import 'package:pdf/widgets.dart' as pw;

class ExportBloc extends Bloc<ExportEvent, ExportState> {
  ExportBloc() : super(const ExportInitial()) {
    on<ExportFilesByExtensions>(_onExportFilesByExtensions);
    on<ToggleExtensionSelection>(_onToggleExtensionSelection);
    on<ClearSelection>(_onClearSelection);
  }

  void _onClearSelection(
    ClearSelection event,
    Emitter<ExportState> emit,
  ) {
    emit(const ExportExtensionsUpdated({}));
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
      final savePath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save PDF Export',
        fileName: 'code_export_${DateTime.now().millisecondsSinceEpoch}.pdf',
        allowedExtensions: ['pdf'],
      );

      if (savePath == null) {
        emit(const ExportCancelled());
        return;
      }

      final codeFiles = <String>[];

      void findCodeFiles(DirectoryNode node) {
        if (!node.isDirectory) {
          final ext = p.extension(node.path).toLowerCase();
          if (event.extensions.contains(ext)) {
            codeFiles.add(node.path);
          }
        } else {
          for (final child in node.children) {
            findCodeFiles(child);
          }
        }
      }

      findCodeFiles(event.rootDirectory);
      if (codeFiles.isEmpty) {
        emit(const ExportError('No matching code files found'));
        return;
      }

      emit(const ExportInProgress());
      final pdfFile = await _createCodePdf(
        filePaths: codeFiles,
        savePath: savePath,
      );
      OpenFile.open(pdfFile.path);

      emit(ExportSuccess(codeFiles.length, savePath));
    } catch (e) {
      emit(ExportError('PDF export failed: ${e.toString()}'));
    }
  }

  Future<File> _createCodePdf({
    required List<String> filePaths,
    required String? savePath,
  }) async {
    final fontData = await rootBundle.load('assets/fonts/DejaVuSansMono.ttf');
    final codeFont = pw.Font.ttf(fontData);

    final pdf = pw.Document();

    final sectionStyle = pw.TextStyle(
      font: pw.Font.times(),
      fontSize: 14,
      fontWeight: pw.FontWeight.bold,
    );

    final codeStyle = pw.TextStyle(
      font: codeFont,
      fontSize: 8,
      lineSpacing: 1,
    );

    final files = <Map<String, String>>[];
    for (final path in filePaths) {
      try {
        files.add({
          'name': p.basename(path),
          'content': await File(path).readAsString(),
        });
      } catch (e) {
        debugPrint('Error loading $path: $e');
      }
    }

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(
          595,
          double.infinity,
          marginAll: 20,
        ),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              ...files.asMap().entries.map((entry) {
                final index = entry.key + 1;
                final file = entry.value;

                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text('1.$index', style: sectionStyle),
                        pw.SizedBox(width: 10),
                        pw.Expanded(
                          child: pw.Text(file['name']!, style: sectionStyle),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Text(file['content']!, style: codeStyle),
                    ),
                    pw.SizedBox(height: 20),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );

    // Save to temporary file
    final outputFile = File(savePath!);
    await outputFile.writeAsBytes(await pdf.save());
    return outputFile;
  }
}
