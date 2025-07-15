import 'package:flutter/foundation.dart' show immutable;

@immutable
class Document {
  final int? id;
  final String name;
  final String exportPath; // where the file is stored
  final int totalFiles; // total exported files that are inside the project
  final String projectType; // mobile app, web app, etc.

  const Document({
    this.id,
    required this.name,
    required this.exportPath,
    required this.totalFiles,
    required this.projectType,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'exportPath': exportPath,
        'totalFiles': totalFiles,
        'projectType': projectType,
      };
}
