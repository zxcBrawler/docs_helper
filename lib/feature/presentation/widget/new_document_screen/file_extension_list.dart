import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

class FileExtensionList extends StatefulWidget {
  final Map<String, int> extensions;
  const FileExtensionList({super.key, required this.extensions});

  @override
  State<FileExtensionList> createState() => _FileExtensionListState();
}

class _FileExtensionListState extends State<FileExtensionList> {
  final Set<String> _selectedExtensions = {};

  List<MapEntry<String, int>> get _filteredExtensions {
    return widget.extensions.entries
        .where((entry) => AppConstants.allowedExtensions.contains(entry.key))
        .toList()
      ..sort((a, b) => a.key.compareTo(b.key));
  }

  int get _totalAllowedFiles {
    return _filteredExtensions.fold(0, (sum, entry) => sum + entry.value);
  }

  int get _selectedFilesCount {
    return _filteredExtensions
        .where((entry) => _selectedExtensions.contains(entry.key))
        .fold(0, (sum, entry) => sum + entry.value);
  }

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    '${_selectedExtensions.length} extensions selected\n'
                    '$_selectedFilesCount of $_totalAllowedFiles files',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: AppColor.iconColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredExtensions.length,
                itemBuilder: (context, index) {
                  final entry = _filteredExtensions[index];
                  final extension = entry.key;
                  final count = entry.value;

                  return ListTile(
                    leading: Checkbox(
                      activeColor: AppColor.mainAccentColor,
                      value: _selectedExtensions.contains(extension),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedExtensions.add(extension);
                          } else {
                            _selectedExtensions.remove(extension);
                          }
                        });
                      },
                    ),
                    title: Text(
                      extension,
                    ),
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
                      setState(() {
                        _selectedExtensions.clear();
                      });
                    },
                    child: const Text(
                      'Clear all',
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _selectedExtensions.isEmpty ? null : () {},
                    child: const Text(
                      'Export selected',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
