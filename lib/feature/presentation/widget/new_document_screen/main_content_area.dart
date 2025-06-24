import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_state.dart';
import 'package:docs_helper/feature/presentation/widget/new_document_screen/file_extension_list.dart';
import 'package:docs_helper/feature/presentation/widget/new_document_screen/folder_tree_view.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart' as path;

Widget buildMainContentArea(FileState state, BuildContext context) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: AppColor.secondaryBackground,
                    borderRadius: AppConstants.deaultElementBorderRadius),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "File Explorer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textColor,
                      ),
                    ),
                    Text(
                      "Click on a file to preview it, or expand a folder to see its contents",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.iconColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 13),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: AppColor.secondaryBackground,
                    borderRadius: AppConstants.deaultElementBorderRadius,
                  ),
                  child: buildTreeView(
                    [state.directoryNode!],
                    context,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 13),
        FileExtensionList(
          extensions: getFileExtensionsList(state.directoryNode!),
          rootDirectory: state.directoryNode!,
        ),
      ],
    ),
  );
}

Map<String, int> getFileExtensionsList(DirectoryNode node) {
  final extensions = <String, int>{};

  void traverse(DirectoryNode currentNode) {
    if (currentNode.isDirectory) {
      for (final child in currentNode.children) {
        traverse(child);
      }
    } else {
      final extension = path.extension(currentNode.path).toLowerCase();
      if (extension.isNotEmpty) {
        extensions[extension] = (extensions[extension] ?? 0) + 1;
      }
    }
  }

  traverse(node);

  final sortedKeys = extensions.keys.toList()..sort();
  final sortedMap = {for (var key in sortedKeys) key: extensions[key]!};
  return sortedMap;
}
