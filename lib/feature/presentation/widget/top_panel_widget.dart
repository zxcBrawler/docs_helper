import 'package:docs_helper/config/app_constants.dart';
import 'package:docs_helper/core/custom_widgets/basic_icon_button.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:docs_helper/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ClipRRect(
        borderRadius: AppConstants.deaultElementBorderRadius,
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          height: 65,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Docs Helper',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 6,
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        BasicIconButton(
                            icon: const Icon(LucideIcons.plus),
                            onPressed: () {
                              router.push(AppPages.newDocument.path);
                            },
                            tooltip: 'Add new document'),
                        BasicIconButton(
                            icon: const Icon(LucideIcons.user),
                            onPressed: () {
                              //ThemeSwitcher.of(context).toggleTheme();
                              router.push(AppPages.profile.path);
                            },
                            tooltip: 'Profile'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
