import 'package:bored_app/models/citation.dart';
import 'package:flutter/widgets.dart';

class CitProvider extends ChangeNotifier {
  List<Citation> citations = [];

  void addProduit(Citation newCitation) {
    citations.add(newCitation);

    notifyListeners();
  }
}
