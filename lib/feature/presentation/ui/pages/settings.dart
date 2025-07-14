import 'package:docs_helper/config/app_constants.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppConstants.deaultElementBorderRadius,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
