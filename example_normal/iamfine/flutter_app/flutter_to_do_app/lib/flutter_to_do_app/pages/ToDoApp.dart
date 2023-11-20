import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_to_do_app/flutter_to_do_app.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'home/homecontroller.dart';
import 'intro/intro.dart';

SharedPreferences? preferences;

class ToDoApp extends GetView<ToDoAppController> {
  const ToDoApp({super.key});

  @override
  ToDoAppController get controller => Get.put(ToDoAppController());

  @override
  Widget build(BuildContext context) {
    return MyAppWrapper();
  }
}

class ToDoAppController extends GetxController {
  ToDoAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  bool _init = false;
  @override
  void initState() {
    super.initState();
    main();
  }

  main() async {
    WidgetsFlutterBinding.ensureInitialized();
    preferences = await SharedPreferences.getInstance();
    await GetStorage.init();
    await Get.putAsync(() => StoreService().init());
    Get.put(Homecontroller(
        taskRepository: TaskRepository(taskProvider: TaskProvider())));

    setState(() {
      _init = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _init
        ? const MyApp()
        : const Center(
            child: Text("准备中。。。"),
          );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
          )),
          colorScheme:
              const ColorScheme.light().copyWith(primary: Colors.deepPurple),
          primaryColor: Colors.deepPurple,

          // ignore: prefer_const_constructors
          textTheme: TextTheme(
            displayLarge: const TextStyle(
                fontSize: 32,
                fontFamily: "Ubuntu-Medium.ttf",
                color: Colors.black),
            displayMedium: const TextStyle(
                fontSize: 17,
                fontFamily: "Ubuntu-Regular.ttf",
                color: Colors.black54),
            displaySmall: const TextStyle(
                fontSize: 24,
                fontFamily: "Ubuntu-Medium.ttf",
                color: Colors.white),
            headlineMedium: const TextStyle(
                fontSize: 36,
                fontFamily: "Ubuntu-Medium.ttf",
                color: Colors.black,
                fontWeight: FontWeight.w500),
            headlineSmall: const TextStyle(
                fontSize: 24,
                fontFamily: "Ubuntu-Medium.ttf",
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500),
            labelLarge: const TextStyle(
                fontSize: 25,
                fontFamily: "Ubuntu-Medium.ttf",
                color: Colors.deepPurple),
            titleLarge: const TextStyle(
                fontSize: 25,
                fontFamily: "Ubuntu-Medium.ttf",
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ).apply(fontFamily: "Ubuntu")),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Intro(),
    );
  }
}
