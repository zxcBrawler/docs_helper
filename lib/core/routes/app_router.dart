import 'package:docs_helper/core/routes/routes.dart';
import 'package:docs_helper/feature/presentation/ui/export_failed_screen.dart';
import 'package:docs_helper/feature/presentation/ui/export_success_screen.dart';
import 'package:docs_helper/feature/presentation/ui/new_document_screen.dart';
import 'package:docs_helper/feature/presentation/ui/pages/dashboard.dart';
import 'package:docs_helper/feature/presentation/ui/main_screen.dart';
import 'package:docs_helper/feature/presentation/ui/pages/help.dart';
import 'package:docs_helper/feature/presentation/ui/pages/history.dart';
import 'package:docs_helper/feature/presentation/ui/pages/settings.dart';
import 'package:docs_helper/feature/presentation/ui/profle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: AppPages.dashboard.path,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppPages.newDocument.path,
      name: AppPages.newDocument.name,
      builder: (_, __) => const NewDocumentScreen(),
    ),
    GoRoute(
      path: AppPages.profile.path,
      name: AppPages.profile.name,
      builder: (_, __) => const Profile(),
    ),
    GoRoute(
      path: AppPages.exportSuccess.path,
      name: AppPages.exportSuccess.name,
      builder: (context, state) {
        String fileLocation = state.extra as String;
        return ExportSuccessScreen(fileLocation: fileLocation);
      },
    ),
    GoRoute(
      path: AppPages.exportError.path,
      name: AppPages.exportError.name,
      builder: (context, state) {
        String errorMessage = state.extra as String;
        return ExportFailedScreen(errorMessage: errorMessage);
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (_, __, child) => MainScreen(child: child),
      routes: [
        GoRoute(
          path: AppPages.dashboard.path,
          name: AppPages.dashboard.name,
          pageBuilder: (_, __) => const NoTransitionPage(child: Dashboard()),
        ),
        GoRoute(
          path: AppPages.history.path,
          name: AppPages.history.name,
          pageBuilder: (_, __) => const NoTransitionPage(child: History()),
        ),
        GoRoute(
          path: AppPages.help.path,
          name: AppPages.help.name,
          pageBuilder: (_, __) =>
              const NoTransitionPage(child: HelpAndSupport()),
        ),
        GoRoute(
          path: AppPages.settings.path,
          name: AppPages.settings.name,
          pageBuilder: (_, __) => const NoTransitionPage(child: Settings()),
        ),
      ],
    ),
  ],
);
