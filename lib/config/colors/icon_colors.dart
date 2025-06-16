import 'package:dev_icons/dev_icons.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class IconsConfig {
  static const Map<String, Color> _languageColors = {
    'dart': Color(0xFF00B4AB), // Dart teal
    'csharp': Color(0xFF178600), // C# green
    'python': Color(0xFF3572A5), // Python blue
    'java': Color(0xFFB07219), // Java brown
    'javascript': Color(0xFFF1E05A), // JS yellow
    'typescript': Color(0xFF3178C6), // TS blue
    'kotlin': Color(0xFFA97BFF), // Kotlin purple
    'swift': Color(0xFFF05138), // Swift orange
    'go': Color(0xFF00ADD8), // Go cyan
    'rust': Color(0xFFDEA584), // Rust light brown
    'ruby': Color(0xFF701516), // Ruby red
    'php': Color(0xFF4F5D95), // PHP purple
    'c': Color(0xFF555555), // C gray
    'cpp': Color(0xFFF34B7D), // C++ pink
    'html': Color(0xFFE34C26), // HTML orange
    'css': Color(0xFF563D7C), // CSS purple
    'bash': Color(0xFF89E051), // Bash green
    'sql': Color(0xFFE38C00), // SQL orange
    'json': Color(0xFF292929), // JSON dark gray
    'yaml': Color(0xFFCB171E), // YAML red
    'xml': Color(0xFF0060AC), // XML blue
  };

  static const _fileIconData = {
    '.cs': _IconData(DevIcons.csharpPlain, 'csharp'),
    '.java': _IconData(DevIcons.javaPlain, 'java'),
    '.py': _IconData(DevIcons.pythonPlain, 'python'),
    '.js': _IconData(DevIcons.javascriptPlain, 'javascript'),
    '.html': _IconData(DevIcons.html5Plain, 'html'),
    '.css': _IconData(DevIcons.css3Plain, 'css'),
    '.dart': _IconData(DevIcons.dartPlain, 'dart'),
    '.kt': _IconData(DevIcons.kotlinPlain, 'kotlin'),
    '.swift': _IconData(DevIcons.swiftPlain, 'swift'),
    '.go': _IconData(DevIcons.goPlain, 'go'),
    '.rs': _IconData(DevIcons.rustPlain, 'rust'),
    '.php': _IconData(DevIcons.phpPlain, 'php'),
    '.rb': _IconData(DevIcons.rubyPlain, 'ruby'),
    '.c': _IconData(DevIcons.cPlain, 'c'),
    '.cpp': _IconData(DevIcons.cplusplusPlain, 'cpp'),
  };

  static Color getColorForLanguage(String language) {
    return _languageColors[language.toLowerCase()] ?? AppColor.iconColor;
  }

  static IconData getFileIcon(String extension) {
    return _fileIconData[extension.toLowerCase()]?.icon ?? LucideIcons.fileText;
  }
}

class _IconData {
  final IconData icon;
  final String language;

  const _IconData(this.icon, this.language);
}
