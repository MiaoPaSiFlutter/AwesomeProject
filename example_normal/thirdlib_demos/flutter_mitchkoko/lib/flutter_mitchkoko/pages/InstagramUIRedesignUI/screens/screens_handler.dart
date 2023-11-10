import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/screens_handler_controller.dart';
import 'home_screen/home.dart';
import 'home_screen/widgets/IURBottomBar.dart';
import 'home_screen/widgets/IURFAB.dart';
import 'profile_screen/profile_screen.dart';
import 'search_screen/search.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final controller = Get.put(ScreensHandlerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: IURBottomBar(),
        ),
      ),
      floatingActionButton: const IURFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GetBuilder<ScreensHandlerController>(
        id: controller.idToUpdateWith,
        global: true,
        builder: (_) {
          return PageView(
            key: const ValueKey("pageView"),
            controller: _.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              HomeScreen(),
              SearchScreen(),
              Center(
                child: Text("Under Constructiing"),
              ),
              Center(
                child: Text("Under Constructiing"),
              ),
              ProfileScreen(),
            ],
          );
        },
      ),
    );
  }
}
