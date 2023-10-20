// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class OffsetNotifier with ChangeNotifier {
  double offset = 0;
  OffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      offset = pageController.offset;
      notifyListeners();
    });
  }
}
