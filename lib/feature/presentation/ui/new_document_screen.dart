import 'package:dev_icons/dev_icons.dart';
import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/custom_widgets/basic_icon_button.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_event.dart';
import 'package:docs_helper/feature/presentation/bloc/file/file_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:path/path.dart' as path;

class NewDocumentScreen extends StatelessWidget {
  const NewDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => service<FileBloc>(),
      child: const _NewDocumentView(),
    );
  }
}

class _NewDocumentView extends StatelessWidget {
  const _NewDocumentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: Column(
        children: [
          Row(
            children: [
              BasicIconButton(
                icon: const Icon(LucideIcons.chevronLeft),
                onPressed: () => router.pop(),
              ),
              BlocBuilder<FileBloc, FileState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<FileBloc>().add(const PickFolderEvent());
                    },
                    child: const Text('Pick Folder'),
                  );
                },
              ),
            ],
          ),
          BlocConsumer<FileBloc, FileState>(
            listener: (context, state) {
              if (state is FileError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error!)),
                );
              }
            },
            builder: (context, state) {
              switch (state) {
                case FileLoading _:
                  return const Center(child: CircularProgressIndicator());
                case DirectoryTreeBuildDone _:
                  return _buildMainContentArea(state, context);
                case FileError _:
                  return const Center(child: Text('Error'));
                default:
                  return const Center(
                    child: Text('Select a folder to view its contents'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMainContentArea(FileState state, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppConstants.defaultOuterPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTreeView(
              [state.directoryNode!],
              context,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsetsGeometry.only(left: 13),
              child: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.secondaryBackground,
                      borderRadius: AppConstants.deaultElementBorderRadius),
                  child: const Column()),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildTreeView(List<DirectoryNode> nodes, BuildContext context,
      [int depth = 0]) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: nodes.map((node) {
            if (node.isDirectory) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 16.0 * depth),
                    leading: Icon(
                      node.isExpanded ? Icons.folder_open : Icons.folder,
                      color: AppColor.mainAccentColor,
                    ),
                    title: Text(node.name),
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
                      child: _buildTreeView(node.children, context, depth + 1),
                    ),
                ],
              );
            } else {
              return ListTile(
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
}
