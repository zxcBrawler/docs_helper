import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_state.dart';
import 'package:docs_helper/feature/presentation/widget/new_document_screen/file_extension_list.dart';
import 'package:docs_helper/feature/presentation/widget/new_document_screen/folder_tree_view.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart' as path;

Widget buildMainContentArea(FileState state, BuildContext context) {
  final extensions = getFileExtensionsList(state.directoryNode!);

  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: buildTreeView(
            [state.directoryNode!],
            context,
          ),
        ),
        const SizedBox(width: 13),
        FileExtensionList(
          extensions: extensions,
        ),
      ],
    ),
  );
}

List<String> getFileExtensionsList(DirectoryNode node) {
  final extensions = <String>{};

  void traverse(DirectoryNode currentNode) {
    if (currentNode.isDirectory) {
      for (final child in currentNode.children) {
        traverse(child);
      }
    } else {
      final extension = path.extension(currentNode.path).toLowerCase();
      if (extension.isNotEmpty) {
        extensions.add(extension);
      }
    }
  }

  traverse(node);
  return extensions.toList()..sort();
}
