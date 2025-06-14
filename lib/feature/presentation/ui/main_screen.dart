import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/feature/presentation/widget/left_navigation_widget.dart';
import 'package:docs_helper/feature/presentation/widget/top_panel_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: Padding(
        padding: AppConstants.defaultOuterPadding,
        child: Column(
          children: [
            const TopBarWidget(),
            Expanded(
              child: Row(
                children: [
                  const LeftNavigationPanel(),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: widget.child,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
