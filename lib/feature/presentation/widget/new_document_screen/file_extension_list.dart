import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

class FileExtensionList extends StatefulWidget {
  final List<String> extensions;
  const FileExtensionList({super.key, required this.extensions});
  static const allowedExtensions = {
    '.axaml', // XAML
    '.xaml', // XAML
    '.cs', // C#
    '.dart', // Dart
    '.java', // Java
    '.kt', // Kotlin
    '.swift', // Swift
    '.go', // Go
    '.rs', // Rust
    '.py', // Python
    '.js', // JavaScript
    '.ts', // TypeScript
    '.php', // PHP
    '.rb', // Ruby
    '.sh', // Shell script
    '.c', // C
    '.cpp', // C++
    '.h', // C/C++ header
    '.m', // Objective-C
    '.html', // HTML
    '.css', // CSS
  };
  @override
  State<FileExtensionList> createState() => _FileExtensionListState();
}

class _FileExtensionListState extends State<FileExtensionList> {
  // Track selected extensions
  final Set<String> _selectedExtensions = {};

  List<String> get _filteredExtensions => widget.extensions
      .where((ext) => FileExtensionList.allowedExtensions.contains(ext))
      .toList();

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
                    '${_selectedExtensions.length}/${_filteredExtensions.length} selected',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredExtensions.length,
                itemBuilder: (context, index) {
                  final extension = _filteredExtensions[index];

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
                        }),
                    title: Text(
                      extension,
                      style: const TextStyle(color: AppColor.textColor),
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Clear all',
                        style:
                            TextStyle(color: AppColor.textColor, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(AppColor.mainAccentColor)),
                    onPressed: _selectedExtensions.isEmpty ? null : () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Export selected',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 16,
                          )),
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
