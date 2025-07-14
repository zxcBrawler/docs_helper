import 'package:flutter/material.dart';

class ThemeSwitcher extends InheritedWidget {
  final VoidCallback toggleTheme;

  const ThemeSwitcher({
    super.key,
    required this.toggleTheme,
    required super.child,
  });

  static ThemeSwitcher of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()!;

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) =>
      toggleTheme != oldWidget.toggleTheme;
}
