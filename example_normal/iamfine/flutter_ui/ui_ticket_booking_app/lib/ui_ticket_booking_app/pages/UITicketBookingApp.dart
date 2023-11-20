import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'screens/bottom_bar.dart';
import 'utils/utils_index.dart';

class UITicketBookingApp extends GetView<UITicketBookingAppController> {
  const UITicketBookingApp({super.key});

  @override
  UITicketBookingAppController get controller => Get.put(UITicketBookingAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UITicketBookingAppController extends GetxController {
  UITicketBookingAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const BottomBar(),
    );
  }
}
