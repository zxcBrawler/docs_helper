enum AppPages {
  main,
  dashboard,
  history,
  help,
  settings,
  newDocument,
  exportSuccess,
  exportError,
  profile
}

extension AppPageExtension on AppPages {
  String get path {
    switch (this) {
      case AppPages.dashboard:
        return '/dashboard';
      case AppPages.history:
        return '/history';
      case AppPages.help:
        return '/help';
      case AppPages.main:
        return '/';
      case AppPages.settings:
        return '/settings';
      case AppPages.newDocument:
        return '/newDocument';
      case AppPages.profile:
        return '/profile';
      case AppPages.exportSuccess:
        return '/exportSuccess';
      case AppPages.exportError:
        return '/exportError';
    }
  }
}

extension AppPageExtensionRouteName on AppPages {
  String get routeName {
    switch (this) {
      case AppPages.dashboard:
        return 'Dashboard';
      case AppPages.history:
        return 'History';
      case AppPages.help:
        return 'Help & support';
      case AppPages.main:
        return 'Main';
      case AppPages.settings:
        return 'Settings';
      case AppPages.newDocument:
        return 'Add new document';
      case AppPages.profile:
        return 'Profile';
      case AppPages.exportSuccess:
        return 'Export success';
      case AppPages.exportError:
        return 'Export error';
    }
  }
}
