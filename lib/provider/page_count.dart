import 'package:flutter/material.dart';

class PageCountProvider with ChangeNotifier {
  int _pageCount = 1;
  bool _hasMoreContent = true;
  int get page => _pageCount;
  bool get hasMoreContent => _hasMoreContent;

  void inc() {
    if (!_hasMoreContent) {
      return;
    }
    _pageCount++;
    notifyListeners();
  }

  void setupHasMoreValue(bool hasMoreValue) {
    _hasMoreContent = hasMoreValue;
    notifyListeners();
  }
}
