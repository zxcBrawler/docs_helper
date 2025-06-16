import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AppConstants {
  static const EdgeInsets defaultOuterPadding = EdgeInsets.all(13);
  static const BorderRadiusGeometry deaultElementBorderRadius =
      BorderRadius.all(Radius.circular(15));

  static IconData getFileIcon(String extension) {
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

  static const allowedExtensions = {
    '.axaml', // XAML
    '.xaml', // XAML
    '.xml',
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
    '.sql', // SQL
    '.json', // JSON
    '.yml', // YAML
    '.yaml', // YAML
  };

  static String getLanguageFromExtension(String extension) {
    switch (extension.toLowerCase()) {
      case '.dart':
        return 'dart';
      case '.xml':
      case '.axaml':
        return 'xml';
      case '.cs':
        return 'csharp';
      case '.js':
        return 'javascript';
      case '.py':
        return 'python';
      case '.java':
        return 'java';
      case '.kt':
        return 'kotlin';
      case '.swift':
        return 'swift';
      case '.go':
        return 'go';
      case '.rs':
        return 'rust';
      case '.ts':
        return 'typescript';
      case '.php':
        return 'php';
      case '.rb':
        return 'ruby';
      case '.c':
        return 'c';
      case '.cpp':
        return 'cpp';
      case '.h':
        return 'cpp';
      case '.html':
        return 'html';
      case '.css':
        return 'css';
      case '.sh':
        return 'bash';
      case '.sql':
        return 'sql';
      case '.json':
        return 'json';
      case '.yml':
      case '.yaml':
        return 'yaml';
      default:
        return 'plaintext';
    }
  }
}
