import 'dart:io';

import 'package:docs_helper/feature/data/model/directory.dart';

abstract class ExportRepository {
  Future<File> createPdfFile(List<String> filePaths, String? savePath);
  Future<List<String>> findCodeFiles(
      DirectoryNode node, Set<String> extensions);
}
