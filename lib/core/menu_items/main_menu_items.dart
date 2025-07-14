import 'package:docs_helper/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

List<Map<String, dynamic>> menuItems = [
  {
    'title': 'Dashboard',
    'icon': LucideIcons.layoutDashboard,
    'route': AppPages.dashboard.path,
  },
  {
    'title': 'History',
    'icon': LucideIcons.history,
    'route': AppPages.history.path,
  },
  {
    'title': 'Settings',
    'icon': LucideIcons.settings,
    'route': AppPages.settings.path,
  },
  {
    'title': 'Help & support',
    'icon': LucideIcons.info,
    'route': AppPages.help.path,
  },
];

Color applyMenuItemStyle(
    BuildContext context, bool isSelected, bool isHovered) {
  final colorScheme = Theme.of(context).colorScheme;
  final iconColor = Theme.of(context).iconTheme.color!;
  return isSelected
      ? colorScheme.onSurface
      : isHovered
          ? colorScheme.onSurface
          : iconColor;
}
