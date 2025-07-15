import 'package:docs_helper/feature/domain/usecase/get_all_documents_usecase.dart';
import 'package:docs_helper/feature/presentation/bloc/document/document_event.dart';
import 'package:docs_helper/feature/presentation/bloc/document/document_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final GetAllDocumentsUsecase _allDocumentsUsecase;

  DocumentBloc(this._allDocumentsUsecase) : super(const DocumentInitial()) {
    on<GetAllDocuments>(_getAllDocuments);
  }

  void _getAllDocuments(
      GetAllDocuments event, Emitter<DocumentState> emit) async {
    emit(const DocumentLoading());
    await Future.delayed(const Duration(seconds: 2));
    final documents = await _allDocumentsUsecase.call(params: null);
    emit(DocumentLoaded(documents));
  }
}
