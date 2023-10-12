/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-15 14:45:36
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 10:57:48
 */

import 'package:device_frame/device_frame.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../config/routers/routers.dart';

/// 模拟iphone 13
Size screenSize = const Size(390.0, 844.0);

/// 初始化 GetX
Widget initGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  List<String> launch = LaunchTool.getLocalLaunch();
  return GetMaterialApp(
    /// 入口路由
    initialRoute: RouterS.configNoramlRouts(),

    /// 所有路由集合
    getPages: RouterS.getAllRoutS(),
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeTool.getlocalprofileaboutThemeModel(),
    useInheritedMediaQuery: true,

    /// 是否显示 导航栏右上角 debug 标识
    debugShowCheckedModeBanner: false,

    /// 国际化配置 代理
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate, // ios
    ],

    /// 配置语言
    locale: Locale(launch[0], launch[1]),
    fallbackLocale: const Locale("zh", "CN"),

    translations: LaunchConfig(),

    /// 本地支持语言
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    builder: builder,
  );
}

/// 初始屏幕适配
Widget initScreenUtil({
  required Widget Function(BuildContext, Widget?) builder,
  bool useInheritedMediaQuery = true,
}) {
  return ScreenUtilInit(
    /// UI尺寸
    designSize: const Size(375, 667),
    useInheritedMediaQuery: useInheritedMediaQuery,
    builder: builder,
  );
}

/// 初始化App
initRunApp() {
  final easyLoading = EasyLoading.init();
  Widget body = initGetMaterialApp(builder: (context, child) {
    final size = Get.size;
    final hasFrame = size.width > 500;
    if (hasFrame && kIsWeb) {
      return DeviceFrame(
        device: Devices.ios.iPhone13,
        screen: initScreenUtil(
          builder: (p0, p1) {
            return easyLoading(context, child);
          },
        ),
      );
    } else {
      return initScreenUtil(
        builder: (p0, p1) {
          return easyLoading(context, child);
        },
      );
    }
  });
  return body;
}
