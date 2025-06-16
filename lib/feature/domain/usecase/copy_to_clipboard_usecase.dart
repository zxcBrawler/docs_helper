import 'package:docs_helper/feature/domain/clipboard_service/clipboard_repository.dart';

import '../../../core/usecase/usecase.dart';

class CopyToClipboardUsecase implements UseCase<void, String> {
  final ClipboardRepository _clipboardRepository;

  CopyToClipboardUsecase(this._clipboardRepository);
  @override
  Future<void> call({String? params}) async {
    return await _clipboardRepository.copyToClipboard(params!);
  }
}
