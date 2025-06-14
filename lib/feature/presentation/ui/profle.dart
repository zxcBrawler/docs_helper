import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/custom_widgets/basic_icon_button.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: Column(
        children: [
          BasicIconButton(
              icon: const Icon(
                LucideIcons.chevronLeft,
                color: AppColor.iconColor,
              ),
              onPressed: () {
                router.pop();
              }),
        ],
      ),
    );
  }
}
