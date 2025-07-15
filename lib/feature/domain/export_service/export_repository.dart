import 'dart:io';

import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/data/model/document.dart';

abstract class ExportRepository {
  Future<Document> saveExportedDocumentLocally(List<String> documentContents);
  Future<File> createPdfFile(List<String> filePaths, String? savePath);

  Future<List<String>> findCodeFiles(
      DirectoryNode node, Set<String> extensions);
}
