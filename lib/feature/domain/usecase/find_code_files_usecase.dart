import 'package:docs_helper/core/usecase/usecase.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/domain/export_service/export_repository.dart';

class FindCodeFilesUsecase
    implements UseCase<List<String>, Map<DirectoryNode, Set<String>>> {
  final ExportRepository _exportRepository;

  FindCodeFilesUsecase(this._exportRepository);

  @override
  Future<List<String>> call({Map<DirectoryNode, Set<String>>? params}) async {
    return await _exportRepository.findCodeFiles(
        params!.keys.first, params.values.first);
  }
}
