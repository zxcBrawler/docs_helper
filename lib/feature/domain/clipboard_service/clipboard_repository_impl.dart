import 'package:docs_helper/feature/domain/clipboard_service/clipboard_repository.dart';
import 'package:flutter/services.dart';

class ClipboardRepositoryImpl implements ClipboardRepository {
  @override
  Future<void> copyToClipboard(String content) async {
    await Clipboard.setData(ClipboardData(text: content));
  }
}
