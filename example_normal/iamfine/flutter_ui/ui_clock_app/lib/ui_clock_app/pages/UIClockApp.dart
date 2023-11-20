import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'models/my_theme_provider.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

class UIClockApp extends GetView<UIClockAppController> {
  const UIClockApp({super.key});

  @override
  UIClockAppController get controller => Get.put(UIClockAppController());

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class UIClockAppController extends GetxController {
  UIClockAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyThemeModel(),
      child: Consumer<MyThemeModel>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Analog Clock',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
