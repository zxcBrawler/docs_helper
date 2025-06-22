import 'package:docs_helper/feature/data/model/directory.dart';

abstract class ExportRepository {
  Future<void> exportToPdf(List<DirectoryNode> nodes, String filePath);
}
