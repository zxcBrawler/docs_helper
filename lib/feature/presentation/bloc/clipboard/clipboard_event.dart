abstract class ClipboardEvent {}

class CopyToClipboard extends ClipboardEvent {
  final String content;
  CopyToClipboard(this.content);
}

class ResetClipboardState extends ClipboardEvent {}
