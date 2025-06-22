import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_event.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FileExtensionList extends StatelessWidget {
  final Map<String, int> extensions;
  final DirectoryNode rootDirectory;

  const FileExtensionList({
    super.key,
    required this.extensions,
    required this.rootDirectory,
  });

  List<MapEntry<String, int>> _filteredExtensions(Map<String, int> extensions) {
    return extensions.entries
        .where((entry) => AppConstants.allowedExtensions.contains(entry.key))
        .toList()
      ..sort((a, b) => a.key.compareTo(b.key));
  }

  int _totalAllowedFiles(List<MapEntry<String, int>> filteredExtensions) {
    return filteredExtensions.fold(0, (sum, entry) => sum + entry.value);
  }

  int _selectedFilesCount(List<MapEntry<String, int>> filteredExtensions,
      Set<String>? selectedExtensions) {
    if (selectedExtensions == null || selectedExtensions.isEmpty) return 0;

    return filteredExtensions
        .where((entry) => selectedExtensions.contains(entry.key))
        .fold(0, (sum, entry) => sum + entry.value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => service<ExportBloc>(),
      child: BlocBuilder<ExportBloc, ExportState>(
        builder: (context, state) {
          final filteredExtensions = _filteredExtensions(extensions);
          final totalAllowedFiles = _totalAllowedFiles(filteredExtensions);
          final selectedFilesCount =
              _selectedFilesCount(filteredExtensions, state.selectedExtensions);

          return Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.secondaryBackground,
                borderRadius: AppConstants.deaultElementBorderRadius,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Choose file extensions to export',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textColor,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${state.selectedExtensions?.length ?? 0} extensions selected',
                              style: const TextStyle(
                                color: AppColor.iconColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '$selectedFilesCount of $totalAllowedFiles files',
                              style: const TextStyle(
                                color: AppColor.iconColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredExtensions.length,
                      itemBuilder: (context, index) {
                        final entry = filteredExtensions[index];
                        final extension = entry.key;
                        final count = entry.value;
                        return ListTile(
                          leading: Checkbox(
                            checkColor: AppColor.textColor,
                            value:
                                state.selectedExtensions?.contains(extension) ??
                                    false,
                            onChanged: (bool? value) {
                              context.read<ExportBloc>().add(
                                    ToggleExtensionSelection(extension),
                                  );
                            },
                          ),
                          title: Text(extension),
                          trailing: Text(
                            '$count file${count == 1 ? '' : 's'}',
                            style: const TextStyle(
                              color: AppColor.iconColor,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<ExportBloc>().add(ClearSelection());
                          },
                          child: const Text('Clear all'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed:
                              (state.selectedExtensions?.isEmpty ?? true) ||
                                      state is ExportInProgress
                                  ? null
                                  : () async {
                                      context.read<ExportBloc>().add(
                                            ExportFilesByExtensions(
                                              rootDirectory,
                                              state.selectedExtensions!,
                                            ),
                                          );
                                    },
                          child: SizedBox(
                            width: 100,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: state is ExportInProgress
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(),
                                    )
                                  : state is ExportSuccess
                                      ? const Icon(
                                          LucideIcons.check,
                                          size: 20,
                                        )
                                      : const Text(
                                          'Export',
                                        ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
