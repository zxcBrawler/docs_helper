import 'dart:ui';

import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/routes/routes.dart';
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

Color applyMenuItemStyle(bool isSelected, bool isHovered) {
  return isSelected
      ? AppColor.textColor
      : isHovered
          ? AppColor.textColor
          : AppColor.iconColor;
}
