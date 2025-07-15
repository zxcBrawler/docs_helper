import 'package:docs_helper/feature/data/datasource/local/local_database_init.dart';
import 'package:docs_helper/feature/data/dto/create_document_dto.dart';
import 'package:docs_helper/feature/data/model/document.dart';
import 'package:docs_helper/feature/domain/database_service/database_repository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  @override
  Future<Document> createNewDocument(
      CreateDocumentDto createDocumentDto) async {
    final db = await database;
    Document document = Document(
        name: createDocumentDto.name,
        exportPath: createDocumentDto.exportPath,
        totalFiles: createDocumentDto.projectFiles.length,
        projectType: createDocumentDto.projectType);
    db.insert(
      "document",
      document.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return document;
  }

  @override
  Future<List<Document>> getAllDocuments() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('document');
    return List.generate(maps.length, (index) {
      return Document(
        id: maps[index]['id'],
        name: maps[index]['name'],
        exportPath: maps[index]['exportPath'],
        totalFiles: maps[index]['totalFiles'],
        projectType: maps[index]['projectType'],
      );
    });
  }
}
