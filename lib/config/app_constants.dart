import 'package:docs_helper/config/colors/icon_colors.dart';
import 'package:flutter/widgets.dart';

class AppConstants {
  static const EdgeInsets defaultOuterPadding = EdgeInsets.all(13);
  static const BorderRadius deaultElementBorderRadius =
      BorderRadius.all(Radius.circular(15));

  static const _languageMap = {
    '.dart': 'dart',
    '.xml': 'xml',
    '.axaml': 'xml',
    '.cs': 'csharp',
    '.js': 'javascript',
    '.py': 'python',
    '.java': 'java',
    '.kt': 'kotlin',
    '.swift': 'swift',
    '.go': 'go',
    '.rs': 'rust',
    '.ts': 'typescript',
    '.php': 'php',
    '.rb': 'ruby',
    '.c': 'c',
    '.cpp': 'cpp',
    '.h': 'cpp',
    '.html': 'html',
    '.css': 'css',
    '.sh': 'bash',
    '.sql': 'sql',
    '.json': 'json',
    '.yml': 'yaml',
    '.yaml': 'yaml',
  };

  static const allowedExtensions = {
    '.axaml',
    '.xaml',
    '.xml',
    '.cs',
    '.dart',
    '.java',
    '.kt',
    '.swift',
    '.go',
    '.rs',
    '.py',
    '.js',
    '.ts',
    '.php',
    '.rb',
    '.sh',
    '.c',
    '.cpp',
    '.h',
    '.m',
    '.html',
    '.css',
    '.sql',
    '.json',
    '.yml',
    '.yaml',
  };

  static String getLanguageFromExtension(String extension) {
    return _languageMap[extension.toLowerCase()] ?? 'plaintext';
  }

  static Color getFileIconColor(String extension) {
    final language = getLanguageFromExtension(extension);
    return IconsConfig.getColorForLanguage(language);
  }
}
