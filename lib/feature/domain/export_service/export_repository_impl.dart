import 'dart:io';

import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/data/model/document.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:docs_helper/feature/domain/export_service/export_repository.dart';

class ExportRepositoryImpl implements ExportRepository {
  @override
  Future<File> createPdfFile(List<String> filePaths, String? savePath) async {
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
        print('Error loading $path: $e');
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
    final outputFile = File(savePath!);
    await outputFile.writeAsBytes(await pdf.save());
    return outputFile;
  }

  @override
  Future<List<String>> findCodeFiles(
      DirectoryNode node, Set<String> extensions) async {
    final codeFiles = <String>[];

    if (!node.isDirectory) {
      final ext = p.extension(node.path).toLowerCase();
      if (extensions.contains(ext)) {
        codeFiles.add(node.path);
      }
    } else {
      for (final child in node.children) {
        final childFiles = await findCodeFiles(child, extensions);
        codeFiles.addAll(childFiles);
      }
    }

    return codeFiles;
  }

  @override
  Future<Document> saveExportedDocumentLocally(List<String> documentContents) {
    // TODO: implement saveExportedDocumentLocally
    throw UnimplementedError();
  }
}
