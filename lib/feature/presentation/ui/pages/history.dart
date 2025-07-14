import 'package:docs_helper/config/app_constants.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
