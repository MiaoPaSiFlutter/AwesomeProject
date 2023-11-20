import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../tools/tools_index.dart';
import 'table_view.dart';

class PeriodicTableApp extends GetView<PeriodicTableAppController> {
  const PeriodicTableApp({super.key});

  @override
  PeriodicTableAppController get controller =>
      Get.put(PeriodicTableAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class PeriodicTableAppController extends GetxController {
  PeriodicTableAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff090C22),
        scaffoldBackgroundColor: kBodyBackgroundColor,
      ),
      title: 'Periodic Table',
      initialRoute: kMainScreenAddress,
      routes: {
        kMainScreenAddress: (context) => const TableView(),
      },
    );
  }
}
