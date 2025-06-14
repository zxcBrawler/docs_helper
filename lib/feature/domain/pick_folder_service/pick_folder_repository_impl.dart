import 'dart:io';

import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/domain/pick_folder_service/pick_folder_repository.dart';
import 'package:path/path.dart' as path;

class PickFolderRepositoryImpl implements PickFolderRepository {
  @override
  Future<DirectoryNode> buildDirectoryTree(String dirPath) async {
    final directory = Directory(dirPath);
    final children = <DirectoryNode>[];

    await for (final entity in directory.list()) {
      if (entity is Directory) {
        children.add(await buildDirectoryTree(entity.path));
      } else if (entity is File) {
        children.add(DirectoryNode(
          name: path.basename(entity.path),
          path: entity.path,
          isDirectory: false,
          isExpanded: false,
          children: [],
        ));
      }
    }
    children.sort((a, b) {
      if (a.isDirectory && !b.isDirectory) return -1;
      if (!a.isDirectory && b.isDirectory) return 1;
      return a.name.compareTo(b.name);
    });

    return DirectoryNode(
      name: path.basename(directory.path),
      path: directory.path,
      isDirectory: true,
      isExpanded: false,
      children: children,
    );
  }
}
