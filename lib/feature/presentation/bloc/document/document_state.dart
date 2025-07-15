import 'package:docs_helper/feature/data/model/document.dart';

abstract class DocumentState {
  final List<Document>? documents;
  final String? error;
  final bool isLoading;
  const DocumentState({this.documents, this.error, this.isLoading = false});
}

class DocumentInitial extends DocumentState {
  const DocumentInitial() : super(isLoading: false);
}

class DocumentLoading extends DocumentState {
  const DocumentLoading() : super(isLoading: true);
}

class DocumentLoaded extends DocumentState {
  const DocumentLoaded(List<Document> documents)
      : super(documents: documents, isLoading: false);
}

class DocumentError extends DocumentState {
  const DocumentError(String error) : super(error: error, isLoading: false);
}
