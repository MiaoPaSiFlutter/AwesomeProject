import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash/splash.dart';

class BlogClubAppUI extends StatelessWidget {
  const BlogClubAppUI({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white),
    );
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  static String defaultFontFamily = 'Avenir';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Color(0xFF0D253C);
    const Color secondaryTextColor = Color(0xFF2D4379);
    const Color primaryColor = Color(0xff376AED);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            surface: Colors.white,
            onSurface: primaryTextColor,
            onSecondary: secondaryTextColor,
            onPrimary: Colors.white,
            background: Color(0xfffbfcff),
            onBackground: Colors.black),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                  fontSize: 14,
                  fontFamily: defaultFontFamily,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
            backgroundColor: primaryColor,
            contentTextStyle: TextStyle(color: Colors.white)),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: primaryTextColor,
          ),
          headlineSmall: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: primaryTextColor),
          headlineMedium: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 24),
          titleMedium: TextStyle(
            fontFamily: defaultFontFamily,
            color: secondaryTextColor,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          titleSmall: TextStyle(
            fontFamily: defaultFontFamily,
            color: primaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          bodyLarge: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.w400,
            color: primaryTextColor,
            fontSize: 14,
          ),
          bodyMedium: TextStyle(
            fontFamily: defaultFontFamily,
            color: secondaryTextColor,
            fontSize: 12,
          ),
          bodySmall: TextStyle(
              fontFamily: defaultFontFamily,
              color: const Color(0xff7B8BB2),
              fontSize: 10,
              fontWeight: FontWeight.w800),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
