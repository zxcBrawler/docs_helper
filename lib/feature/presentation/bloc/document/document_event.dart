abstract class DocumentEvent {
  final dynamic param;
  const DocumentEvent({this.param});
}

class GetAllDocuments extends DocumentEvent {
  const GetAllDocuments();
}
