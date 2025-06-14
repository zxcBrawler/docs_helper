import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MainApp());
}
