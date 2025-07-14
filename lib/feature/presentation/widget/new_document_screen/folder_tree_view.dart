import 'dart:io';

import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/config/colors/icon_colors.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_event.dart';
import 'package:docs_helper/feature/presentation/widget/new_document_screen/file_content_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:path/path.dart' as path;

Widget buildTreeView(List<DirectoryNode> nodes, BuildContext context,
    [int depth = 0]) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: nodes.map((node) {
            if (node.isDirectory) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    splashColor: Colors.transparent,
                    contentPadding: EdgeInsets.only(left: 16.0 * depth),
                    leading: Icon(
                      node.isExpanded ? Icons.folder_open : Icons.folder,
                      color: AppColors.mainAccentColor,
                    ),
                    title: Row(
                      children: [
                        Text(node.name),
                        const SizedBox(width: 10),
                        if (node.children.isNotEmpty)
                          Text(
                            '(${node.children.length})',
                            style: TextStyle(
                                color: Theme.of(context).iconTheme.color),
                          ),
                      ],
                    ),
                    trailing: node.children.isNotEmpty
                        ? Icon(
                            node.isExpanded
                                ? LucideIcons.chevronDown
                                : LucideIcons.chevronRight,
                          )
                        : null,
                    onTap: () {
                      context.read<FileBloc>().add(
                            ToggleDirectoryExpansionEvent(node),
                          );
                    },
                  ),
                  if (node.isExpanded && node.children.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: buildTreeView(node.children, context, depth + 1),
                    ),
                ],
              );
            } else {
              return ListTile(
                hoverColor: Colors.transparent,
                contentPadding: EdgeInsets.only(left: 16.0 * depth + 40.0),
                leading: Icon(
                  size: 24,
                  IconsConfig.getFileIcon(path.extension(node.path)),
                  color:
                      AppConstants.getFileIconColor(path.extension(node.path)),
                ),
                title: Text(node.name),
                onTap: () => _showFileContent(context, node),
              );
            }
          }).toList(),
        ),
      ],
    ),
  );
}

Future<void> _showFileContent(BuildContext context, DirectoryNode node) async {
  try {
    final content = await File(node.path).readAsString();
    if (!context.mounted) return;

    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => FileContentDialog(
          fileName: node.name,
          content: content,
          extension: path.extension(node.path),
        ),
      );
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cannot preview ${path.extension(node.path)} file '),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
