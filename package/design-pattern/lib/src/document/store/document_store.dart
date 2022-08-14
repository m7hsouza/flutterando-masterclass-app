import 'package:flutter/material.dart';

import '../model/document_model.dart';

class DocumentStore extends ChangeNotifier {
  bool _showFormattedValue = false;

  bool get showFormattedValue => _showFormattedValue;

  DocumentModel? _document;

  DocumentModel? get document => _document;

  void generateNewDocument() {
    _document = DocumentModel();
    notifyListeners();
  }

  void changeShowFormattedValue(bool value) {
    _showFormattedValue = value;
    notifyListeners();
  }
}
