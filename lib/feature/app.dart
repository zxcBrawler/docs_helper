import 'package:docs_helper/config/themes/dark_theme.dart';
import 'package:docs_helper/config/themes/light_theme.dart';
import 'package:docs_helper/core/custom_widgets/theme_switcher.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      builder: (context, child) => ThemeSwitcher(
        toggleTheme: _toggleTheme,
        child: child!,
      ),
    );
  }
}
