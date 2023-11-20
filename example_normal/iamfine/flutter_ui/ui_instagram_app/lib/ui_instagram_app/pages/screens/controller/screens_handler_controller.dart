import 'package:flutter/material.dart';
import 'extensions/sub_methods_helper.dart';
import 'package:get/get.dart';

import '../../helpers/helpers_index.dart';

class ScreensHandlerController extends GetxController {
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  PageController? pageController;
  int? previousIndex;

  String idToUpdateWith = "screensHandler";

  void showScreenWithIndexOf(int index) {
    //
    initNavigationItemsColor(bottomNavigationItems);
    colorizeItemWithIndex(bottomNavigationItems, index);
    pageController!.jumpToPage(index);
    update(
      [idToUpdateWith],
      isClickedOnAnotherItem(index),
    );
  }
}
