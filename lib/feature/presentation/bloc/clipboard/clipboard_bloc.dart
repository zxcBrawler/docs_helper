// clipboard_bloc.dart
import 'dart:async';

import 'package:docs_helper/feature/domain/usecase/copy_to_clipboard_usecase.dart';
import 'package:docs_helper/feature/presentation/bloc/clipboard/clipboard_event.dart';
import 'package:docs_helper/feature/presentation/bloc/clipboard/clipboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClipboardBloc extends Bloc<ClipboardEvent, ClipboardState> {
  final CopyToClipboardUsecase _copyToClipboardUsecase;
  Timer? _resetTimer;

  ClipboardBloc(this._copyToClipboardUsecase)
      : super(const ClipboardInitial()) {
    on<CopyToClipboard>(_onCopyToClipboard);
    on<ResetClipboardState>(_onResetClipboardState);
  }

  Future<void> _onCopyToClipboard(
    CopyToClipboard event,
    Emitter<ClipboardState> emit,
  ) async {
    try {
      await _copyToClipboardUsecase.call(params: event.content);
      emit(const ClipboardCopied());
      _resetTimer?.cancel();
      _resetTimer =
          Timer(const Duration(seconds: 2), () => add(ResetClipboardState()));
    } catch (e) {
      emit(ClipboardError(e.toString()));
    }
  }

  void _onResetClipboardState(
    ResetClipboardState event,
    Emitter<ClipboardState> emit,
  ) {
    emit(const ClipboardInitial());
  }

  @override
  Future<void> close() {
    _resetTimer?.cancel();
    return super.close();
  }
}
