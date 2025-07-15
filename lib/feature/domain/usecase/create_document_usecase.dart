import 'package:docs_helper/core/usecase/usecase.dart';
import 'package:docs_helper/feature/data/dto/create_document_dto.dart';
import 'package:docs_helper/feature/data/model/document.dart';
import 'package:docs_helper/feature/domain/database_service/database_repository.dart';

class CreateDocumentUsecase implements UseCase<Document, CreateDocumentDto> {
  final DatabaseRepository _databaseRepository;

  CreateDocumentUsecase(this._databaseRepository);
  @override
  Future<Document> call({CreateDocumentDto? params}) async {
    return await _databaseRepository.createNewDocument(params!);
  }
}
