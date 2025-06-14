import 'package:docs_helper/core/usecase/usecase.dart';
import 'package:docs_helper/feature/data/model/directory.dart';
import 'package:docs_helper/feature/domain/pick_folder_service/pick_folder_repository.dart';

class PickFolderUsecase implements UseCase<DirectoryNode, String> {
  final PickFolderRepository _pickFolderRepository;

  PickFolderUsecase(this._pickFolderRepository);
  @override
  Future<DirectoryNode> call({String? params}) async {
    return await _pickFolderRepository.buildDirectoryTree(params!);
  }
}
