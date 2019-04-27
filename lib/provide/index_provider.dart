import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class IndexProvider with ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  static IndexProvider getProvider(BuildContext context) {
    return Provide.value<IndexProvider>(context);
  }
}