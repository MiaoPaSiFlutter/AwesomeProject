import 'package:flutter/widgets.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../home/widgets/demopagestate.dart';
import '../ToDoApp.dart';

class IntroController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pagecontroller = PageController();

  actionbutton() {
    if (currentIndex.value == contents.length - 1) {
      preferences!.setBool(DISPLAYINTRO, true);
      Get.off(() => Demopagestate());
    }
    pagecontroller.nextPage(duration: 800.milliseconds, curve: Curves.ease);
  }

  List<IntroContent> contents = [
    IntroContent(
        imageName: Utils.assets('images/taking-notes-amico.png'),
        title: "Create Your Task",
        description:
            "Create your task to make sure every task you have can completed on time"),
    IntroContent(
        imageName: Utils.assets('images/to-do-list-cuate.png'),
        title: "Manage your Daily Task",
        description:
            "By using this application you will be able to manage your daily tasks"),
    IntroContent(
        imageName: Utils.assets('images/writing-a-letter-rafiki.png'),
        title: "Checklist Finished Task",
        description:
            "If you completed your task, so you can view the result you work for each day")
  ];
}

class sharedprefsintro {}
