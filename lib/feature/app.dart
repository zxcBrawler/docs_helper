import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/feature/presentation/ui/desktop_layout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColor.primaryBackground,
        body: Center(
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => Container(color: Colors.blue),
            tablet: (BuildContext context) => Container(color: Colors.yellow),
            desktop: (BuildContext context) => const DesktopLayout(),
          ),
        ),
      ),
    );
  }
}
