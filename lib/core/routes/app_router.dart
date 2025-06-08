import 'package:docs_helper/core/routes/routes.dart';
import 'package:docs_helper/feature/presentation/ui/dashboard.dart';
import 'package:docs_helper/feature/presentation/ui/desktop_layout.dart';
import 'package:docs_helper/feature/presentation/ui/help.dart';
import 'package:docs_helper/feature/presentation/ui/history.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: AppPages.dashboard.path,
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => DesktopLayout(child: child),
      routes: [
        GoRoute(
          path: AppPages.dashboard.path,
          name: AppPages.dashboard.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: Dashboard()),
        ),
        GoRoute(
          path: AppPages.history.path,
          name: AppPages.history.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: History()),
        ),
        GoRoute(
          path: AppPages.help.path,
          name: AppPages.help.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HelpAndSupport()),
        ),
      ],
    ),
  ],
);
