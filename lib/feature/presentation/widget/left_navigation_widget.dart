import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/menu_items/main_menu_items.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LeftNavigationPanel extends StatefulWidget {
  const LeftNavigationPanel({super.key});

  @override
  State<LeftNavigationPanel> createState() => _LeftNavigationPanelState();
}

class _LeftNavigationPanelState extends State<LeftNavigationPanel> {
  int _selectedIndex = 0;
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppConstants.deaultElementBorderRadius,
      child: Container(
        width: 250,
        color: AppColor.secondaryBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: menuItems().length,
                  itemBuilder: (context, index) {
                    final isSelected = index == _selectedIndex;
                    final isHovered = index == _hoveredIndex;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _hoveredIndex = index),
                        onExit: (_) => setState(() => _hoveredIndex = -1),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            _selectedIndex = index;
                            router.go(menuItems()[index]['route']);
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  AppConstants.deaultElementBorderRadius,
                              color: isSelected
                                  ? AppColor.focusColor
                                  : isHovered
                                      ? AppColor.focusColor
                                      : Colors.transparent,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    menuItems()[index]['icon'],
                                    color: applyMenuItemStyle(
                                        isSelected, isHovered),
                                  ),
                                ),
                                Text(
                                  menuItems()[index]['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: applyMenuItemStyle(
                                        isSelected, isHovered),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          LucideIcons.doorOpen,
                          color: AppColor.iconColor,
                        ),
                      ),
                      Text(
                        "Close app",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.iconColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
