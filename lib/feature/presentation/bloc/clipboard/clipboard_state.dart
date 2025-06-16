abstract class ClipboardState {
  final bool isCopied;
  final String? error;
  const ClipboardState({this.isCopied = false, this.error});
}

class ClipboardInitial extends ClipboardState {
  const ClipboardInitial() : super(isCopied: false);
}

class ClipboardCopied extends ClipboardState {
  const ClipboardCopied() : super(isCopied: true);
}

class ClipboardError extends ClipboardState {
  final String message;
  const ClipboardError(this.message) : super(isCopied: false, error: message);
}
