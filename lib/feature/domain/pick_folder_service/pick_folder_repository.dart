import 'package:docs_helper/feature/data/model/directory.dart';

abstract class PickFolderRepository {
  Future<DirectoryNode> buildDirectoryTree(String dirPath);
}
