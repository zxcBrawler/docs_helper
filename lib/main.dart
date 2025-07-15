import 'package:docs_helper/di/service.dart';
import 'package:docs_helper/feature/app.dart';
import 'package:docs_helper/feature/data/datasource/local/local_database_init.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await initDB();
  runApp(const MainApp());
}
