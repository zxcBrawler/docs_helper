import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Database? _database;
Future<Database> get database async {
  if (_database != null) {
    return _database!;
  }
  _database = await initDB();
  return _database!;
}

Future<Database> initDB() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentsDir.path, "databases", "data.db");
    final winLinuxDB = await databaseFactory.openDatabase(
      dbPath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _onCreate,
      ),
    );
    return winLinuxDB;
  } else if (Platform.isAndroid || Platform.isIOS) {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "data.db");
    final iOSAndroidDB = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return iOSAndroidDB;
  }
  throw Exception("Unsupported platform");
}

Future<void> _onCreate(Database database, int version) async {
  final db = database;
  await db.execute(""" CREATE TABLE IF NOT EXISTS document(
            id INTEGER PRIMARY KEY,
            name TEXT,
            exportPath TEXT,
            totalFiles INTEGER,
            projectType TEXT
          )
 """);
}
