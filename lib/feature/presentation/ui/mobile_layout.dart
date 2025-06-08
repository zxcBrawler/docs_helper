import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/feature/presentation/widget/main_content_widget.dart';
import 'package:docs_helper/feature/presentation/widget/top_panel_widget.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppConstants.defaultOuterPadding,
      child: Column(
        children: [
          TopBarWidget(),
          Expanded(
            child: Row(
              children: [MainContentWidget()],
            ),
          ),
        ],
      ),
    );
  }
}
