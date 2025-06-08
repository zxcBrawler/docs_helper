import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

class MainContentWidget extends StatefulWidget {
  final String? location;
  final Widget? child;
  const MainContentWidget({super.key, this.location, this.child});

  @override
  State<MainContentWidget> createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppConstants.deaultElementBorderRadius,
      child: Container(
        color: AppColor.secondaryBackground,
        child: widget.child,
      ),
    );
  }
}
