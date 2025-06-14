import 'package:dev_icons/dev_icons.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:path/path.dart' as path;

Widget buildTreeView(List<DirectoryNode> nodes, BuildContext context,
    [int depth = 0]) {
  return SingleChildScrollView(
    child: Column(
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
                  color: AppColor.mainAccentColor,
                ),
                title: Row(
                  children: [
                    Text(node.name),
                    const SizedBox(width: 10),
                    if (node.children.isNotEmpty)
                      Text(
                        '(${node.children.length})',
                        style: const TextStyle(color: AppColor.iconColor),
                      ),
                  ],
                ),
                trailing: node.children.isNotEmpty
                    ? Icon(
                        node.isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
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
              getFileIcon(path.extension(node.path)),
              color: AppColor.iconColor,
            ),
            title: Text(node.name),
            onTap: () {},
          );
        }
      }).toList(),
    ),
  );
}

IconData getFileIcon(String extension) {
  switch (extension.toLowerCase()) {
    case '.cs':
      return DevIcons.csharpPlain;
    case '.java':
      return DevIcons.javaPlain;
    case '.py':
      return DevIcons.pythonPlain;
    case '.js':
      return DevIcons.javascriptPlain;
    case '.html':
      return DevIcons.html5Plain;
    case '.css':
      return DevIcons.css3Plain;
    case '.dart':
      return DevIcons.dartPlain;
    default:
      return LucideIcons.fileText;
  }
}
