import 'dart:io';

import 'package:docs_helper/core/usecase/usecase.dart';
import 'package:docs_helper/feature/domain/export_service/export_repository.dart';

class CreatePdfUsecase implements UseCase<File, Map<List<String>, String?>> {
  final ExportRepository _exportRepository;

  CreatePdfUsecase(this._exportRepository);
  @override
  Future<File> call({Map<List<String>, String?>? params}) async {
    return await _exportRepository.createPdfFile(
        params!.keys.first, params.values.first);
  }
}
