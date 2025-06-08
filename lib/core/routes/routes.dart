enum AppPages { main, mainContent, dashboard, history, help }

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
      case AppPages.mainContent:
        return '/mainContent';
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
      case AppPages.mainContent:
        return 'MainContent';
    }
  }
}
