import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/feature/presentation/widget/left_navigation_widget.dart';
import 'package:docs_helper/feature/presentation/widget/main_content_widget.dart';
import 'package:docs_helper/feature/presentation/widget/top_panel_widget.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  final Widget child;
  const DesktopLayout({super.key, required this.child});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
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
                  Expanded(child: MainContentWidget(child: widget.child))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
