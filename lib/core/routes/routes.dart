enum AppPages { main, dashboard, history, help, settings, newDocument, profile }

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
    }
  }
}
