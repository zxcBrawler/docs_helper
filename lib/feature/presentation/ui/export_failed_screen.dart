import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExportFailedScreen extends StatefulWidget {
  final String errorMessage;
  const ExportFailedScreen({super.key, required this.errorMessage});

  @override
  State<ExportFailedScreen> createState() => _ExportFailedScreenState();
}

class _ExportFailedScreenState extends State<ExportFailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LucideIcons.xCircle,
              color: AppColors.accentRed,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'An error occurred while exporting files.',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              widget.errorMessage,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                router.pop();
              },
              child: const Text('Back to Export'),
            ),
          ],
        ),
      ),
    );
  }
}
