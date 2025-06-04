import 'package:docs_helper/config/colors/colors.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Container(
                height: 65,
                color: AppColor.focusColor,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Container(
                    width: 250,
                    color: AppColor.mainAccentColor,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      // MainContainer WIDGET will be here
                      child: Container(
                        color: AppColor.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
