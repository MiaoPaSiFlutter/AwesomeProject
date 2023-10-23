import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';

import 'ui/splash/splash_page.dart';

// void main() {
//   runApp(MyApp());
//   //设置状态栏透明
//   SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
//     statusBarIconBrightness: Brightness.dark,
//     statusBarColor: Colors.transparent,
//   );
//   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
// }

class FlutterBooksApp extends StatelessWidget {
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
