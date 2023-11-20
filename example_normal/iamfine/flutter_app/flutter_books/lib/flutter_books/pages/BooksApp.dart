import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'src/splash/splash_page.dart';

// void main() {
//   runApp(MyApp());
//   //设置状态栏透明
//   SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
//     statusBarIconBrightness: Brightness.dark,
//     statusBarColor: Colors.transparent,
//   );
//   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
// }

class BooksApp extends GetView<BooksAppController> {
  const BooksApp({super.key});

  @override
  BooksAppController get controller => Get.put(BooksAppController());

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class BooksAppController extends GetxController {
  BooksAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: BooksColors.white,
        primaryColor: BooksColors.primary,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: BooksColors.textPrimaryColor,
        ),
      ),
      home: SplashPage(),
    );
  }
}
