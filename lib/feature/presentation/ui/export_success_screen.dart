import 'dart:io';

import 'package:docs_helper/config/colors/colors.dart';
import 'package:docs_helper/core/routes/app_router.dart';
import 'package:docs_helper/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExportSuccessScreen extends StatefulWidget {
  final String fileLocation;
  const ExportSuccessScreen({super.key, required this.fileLocation});

  @override
  State<ExportSuccessScreen> createState() => _ExportSuccessScreenState();
}

class _ExportSuccessScreenState extends State<ExportSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LucideIcons.checkCircle,
              color: AppColors.accentGreen,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Files exported successfully!',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'Your file should open automatically in browser.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                if (widget.fileLocation.isEmpty) return;
                if (Platform.isWindows) {
                  await Process.run(
                      'explorer', ['/select,', widget.fileLocation]);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'File location: ',
                  ),
                  Text(
                    widget.fileLocation,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: AppColors.mainAccentColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                router.go(AppPages.dashboard.path);
              },
              child: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
