import 'package:docs_helper/feature/data/dto/create_document_dto.dart';
import 'package:docs_helper/feature/data/model/document.dart';

abstract class DatabaseRepository {
  Future<List<Document>> getAllDocuments();
  Future<Document> createNewDocument(CreateDocumentDto createDocumentDto);
}
