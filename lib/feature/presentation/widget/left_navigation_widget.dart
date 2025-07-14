import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/core/menu_items/main_menu_items.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:flutter/material.dart';

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
        color: Theme.of(context).colorScheme.surface,
        width: 250,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: menuItems.length,
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
                            router.go(menuItems[index]['route']);
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  AppConstants.deaultElementBorderRadius,
                              color: isSelected || isHovered
                                  ? Theme.of(context).focusColor
                                  : Colors.transparent,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    menuItems[index]['icon'],
                                    color: applyMenuItemStyle(
                                        context, isSelected, isHovered),
                                  ),
                                ),
                                Text(
                                  menuItems[index]['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: applyMenuItemStyle(
                                        context, isSelected, isHovered),
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
            ],
          ),
        ),
      ),
    );
  }
}
