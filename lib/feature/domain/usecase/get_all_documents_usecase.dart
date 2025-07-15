import 'package:docs_helper/core/usecase/usecase.dart';
import 'package:docs_helper/feature/data/model/document.dart';
import 'package:docs_helper/feature/domain/database_service/database_repository.dart';

class GetAllDocumentsUsecase implements UseCase<List<Document>, void> {
  final DatabaseRepository _databaseRepository;

  GetAllDocumentsUsecase(this._databaseRepository);

  @override
  Future<List<Document>> call({void params}) async {
    return await _databaseRepository.getAllDocuments();
  }
}
