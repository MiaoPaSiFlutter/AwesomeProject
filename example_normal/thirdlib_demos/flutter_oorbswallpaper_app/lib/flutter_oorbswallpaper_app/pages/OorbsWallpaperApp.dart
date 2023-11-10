import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import 'index.dart';

class OorbsWallpaperApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<OorbsWallpaperApp> createState() => _OorbsWallpaperAppState();

  static _OorbsWallpaperAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_OorbsWallpaperAppState>();
}

class _OorbsWallpaperAppState extends State<OorbsWallpaperApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1),
        () => setState(() => displaySplashImage = false));
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OORBS',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('tr', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: displaySplashImage
          ? Container(
              color: const Color(0xFF111417),
              child: Builder(
                builder: (context) => Image.asset(
                  Utils.assets('images/login.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : const GirisWidget(),
    );
  }
}
