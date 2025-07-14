import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:docs_helper/core/routes/routes.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_bloc.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_event.dart';
import 'package:docs_helper/feature/presentation/bloc/export/export_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<ExportBloc, ExportState>(
      builder: (context, state) {
        final filteredExtensions = _filteredExtensions(extensions);
        final totalAllowedFiles = _totalAllowedFiles(filteredExtensions);
        final selectedFilesCount =
            _selectedFilesCount(filteredExtensions, state.selectedExtensions);
        return Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppConstants.deaultElementBorderRadius,
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              children: [
                _buildExtensionsHeader(
                    selectedFilesCount, totalAllowedFiles, state),
                _buildExtensionsList(filteredExtensions, state),
                _buildExportButtons(state, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildExtensionsHeader(
      int selectedFilesCount, int totalAllowedFiles, ExportState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Choose file extensions to export',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${state.selectedExtensions?.length ?? 0} extensions selected',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                '$selectedFilesCount of $totalAllowedFiles files',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExtensionsList(
      List<MapEntry<String, int>> filteredExtensions, ExportState state) {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredExtensions.length,
        itemBuilder: (context, index) {
          final entry = filteredExtensions[index];
          final extension = entry.key;
          final count = entry.value;
          return ListTile(
            leading: Checkbox(
              value: state.selectedExtensions?.contains(extension) ?? false,
              onChanged: (_) {
                context.read<ExportBloc>().add(
                      ToggleExtensionSelection(extension),
                    );
              },
            ),
            title: Text(extension),
            trailing: Text(
              '$count file${count == 1 ? '' : 's'}',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExportButtons(ExportState state, BuildContext context) {
    return Padding(
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
          BlocListener<ExportBloc, ExportState>(
            listener: (context, state) {
              if (state is ExportSuccess) {
                router.push(AppPages.exportSuccess.path, extra: state.savePath);
              }

              if (state is ExportError) {
                router.push(AppPages.exportError.path, extra: state.error);
              }
            },
            child: ElevatedButton(
              onPressed: (state.selectedExtensions?.isEmpty ?? true) ||
                      state is ExportInProgress
                  ? null
                  : () async {
                      context.read<ExportBloc>().add(
                            ExportFilesByExtensions(
                                rootDirectory, state.selectedExtensions!),
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
                      : const Text(
                          'Export',
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
