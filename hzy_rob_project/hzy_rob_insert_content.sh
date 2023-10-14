#!/bin/bash
# @Descripttion:
# @version:
# @Author: TT
# @Date: 2023-01-29 14:30:11
# @LastEditors: TT
# @LastEditTime: 2023-01-29 14:30:24

# shellcheck disable=SC2034
# shellcheck disable=SC2154

# ======================= 以下内容,可根据自己代码习惯,进行修改 ======================= #
: <<!
这里主要包含
1. pubspec.yaml
    工具库
    图片资源
2. main.dart
3. config
!

# ======================= pubspec ======================= #

: <<!
默认工具库
    这里是作者自己使用的工具模块
    如果你有自己的工具模块,只需要修改这里即可
!

cr_publish_to='\
publish_to: none \
'

cr_localizations='\
  # 国际化\
  flutter_localizations:\
    sdk: flutter\
'
cr_device_frame='\
  # web 模拟器\
  device_frame: ^1.1.0\
'

cr_hzy_normal_tool='\
  # 基础模块\
  hzy_normal_tool:\
    git:\
      url: https://gitee.com/tengteng_fan/hzy_normal_tool.git\
      ref: dev\ 
'
cr_get='\
  get: ^4.6.5'
cr_screenutil='\
  flutter_screenutil: ^5.8.4'
cr_hzy_normal_widget='\ 
  # 基础模块\
  hzy_common_module:\
    git:\
      url: https://gitee.com/tengteng_fan/hzy_common_module.git\
      ref: master\ 
'
cr_eg_module='\
  # 演示模块\
  tuchong_module: \
    git: \
      url: https://gitee.com/tengteng_fan/tuchong_module.git\
      ref: master\ 
'
: <<!
    插入图片索引
!
cr_assent='\
  assets:\
    - assets/images/\
'

# ======================= main.dart ======================= #
: <<!
    这里主要包含的是作者通用项目使用的main.dart内容
!
cr_main="
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'init/init.dart';
import 'config/config_index.dart';

void main() {
  runZonedGuarded(
    () => init(),
    (err, stace) {
      if (kDebugMode) {
        print(FlutterErrorDetails(exception: err, stack: stace));
      }
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, line);
      },
    ),
  );
}

void init() async {
  await GlobalConfig.init();
  runApp(initRunApp());
}
"

# 创建根视图
cr_init_normal="
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../config/routers/routers.dart';

/// 6.1
Size screenSize = const Size(390, 844);

/// 4.7
Size screenIphone7 = const Size(375, 667);

/// 5.8
Size screenIphoneX = const Size(375, 812);

/// 初始化 GetX
Widget initGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
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
    useInheritedMediaQuery: true,
    /// 是否显示 导航栏右上角 debug 标识
    debugShowCheckedModeBanner: false,
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
    designSize: screenSize,
    useInheritedMediaQuery: useInheritedMediaQuery,
    minTextAdapt: true,
    splitScreenMode: true,
    builder: builder,
  );
}

/// 初始化App
Widget initRunApp() {
  Widget body = initGetMaterialApp(builder: (context, child) {
    return initScreenUtil(
      builder: (p0, p1) {
        return child!;
      },
    );
  });
  return body;
}
"
cr_init_plus="

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
    fallbackLocale: const Locale(\"zh\", \"CN\"),

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
Widget initRunApp() {
  final easyLoading = EasyLoading.init();
  Widget body = initGetMaterialApp(builder: (context, child) {
    return initScreenUtil(
      builder: (p0, p1) {
        return easyLoading(context, child);
      },
    );
  });
  return body;
}
"
cr_application="

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
    fallbackLocale: const Locale(\"zh\", \"CN\"),

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
"

cr_my_home_page="
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              \"\$_counter\",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
"
# ======================= config 配置项 ======================= #
: <<!
    基础配置项
        1. GlobalConfig
            app启动初始化配置项
        2. HttpNormalConfig
            域名配置项
        3.  NormalConfig
            基于本项目的配置项,需要你自己添加
        4. PageIdConfig
            路由ID配置项
        5. RouterS 
            路由配置项
!
cr_glob_config="
class GlobalConfig {
  static init() async {
    await initThirdParty();
    await initNetWork();
    await initNormalDefault();
  }

  /// 初始化第三发
  static initThirdParty() async {}

  /// 配置默认数据
  static initNormalDefault() async {}

  /// 配置网络请求
  static initNetWork() async {}
}
"
cr_glob_config_pro="
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'http_normal_config.dart';

class GlobalConfig {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initThirdParty();
    await initNetWork();
  }
  /// 初始化第三发
  static initThirdParty() async {
    EasyLoading.instance.displayDuration = const Duration(
      milliseconds: 1500,
    );
  }

  static initNormalDefault() {
    CommonBaseConfig.loadWidget = createLoadWidget();
  }

  /// 配置网络请求
  static initNetWork() async {
    /**
     * 后台返回数据格式
     * {
     *  code:200,
     *  message:\"成功\",
     *  result:{}
     * }
     * 
    */
    HzyNormalDefaultTransFormer.getInstance().setHttpConfig(
      config: HzyNormalHttpResponeConfig(
        status: \"code\",
        code: \"Stamp\",
        msg: \"message\",
        data: \"result\",
        successcode: 200,
      ),
    );

    // 注入网络请求组件
    Get.put(
      HzyNormalClient(
        normalHttpConfig: HzyNormalHttpConfig(
          baseUrl: HttpNormalConfig.configbaseUrl(),
          interceptors: [],
        ),
      ),
      permanent: true,
      tag: HzyNormalClient.defaultClientTag,
    );
  }
}
"

# 创建网络请求配置项
cr_http_normal="
/// 用于扩展你的请求域名
enum HttpBaseUrlEnum {
  /// 默认域名
  normalUrl,

  /// 其他域名
  otherUrl,
}

/// 用于配置当前环境选择
enum HttpEnvironEnmu {
  /// 开发环境
  debug,

  /// 发布环境
  release,
}

class HttpNormalConfig {
  static const HttpEnvironEnmu environ = HttpEnvironEnmu.release;

  /*
   * @description:获取完整url 
   * @param {*}
   * @return {*}
   */
  static conFigNetWorkPath({
    required String path,
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
    HttpEnvironEnmu environEnmu = HttpNormalConfig.environ,
  }) {
    String baseurl = configbaseUrl(urlEnum: urlEnum, environEnmu: environ);
    return baseurl + path;
  }

  /*
   * @description: 获取baseUrl 
   * @param {*}
   * @return {*}
   */
  static configbaseUrl({
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
    HttpEnvironEnmu environEnmu = HttpNormalConfig.environ,
  }) {
    String baseUrl = \"\";
    switch (environEnmu) {
      case HttpEnvironEnmu.debug:
        baseUrl = configDebugBaseUrl(urlEnum: urlEnum);
        break;
      case HttpEnvironEnmu.release:
        baseUrl = configReleaseBaseUrl(urlEnum: urlEnum);
        break;
      default:
    }
    return baseUrl;
  }

  /*
   * @description: 获取开发环境baseUrl
   * @param {*}
   * @return {*}
   */
  static configDebugBaseUrl({
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
  }) {
    String url = \"\";
    switch (urlEnum) {
      case HttpBaseUrlEnum.normalUrl:
        url = \"https://api.apiopen.top/api\";
        break;
      case HttpBaseUrlEnum.otherUrl:
        url = \"https://api.apiopen.top/api\";
        break;
      default:
    }
    return url;
  }

  /*
   * @description: 获取预发布环境baseurl
   * @param {*}
   * @return {*}
   */
  static configReleaseBaseUrl({
    HttpBaseUrlEnum urlEnum = HttpBaseUrlEnum.normalUrl,
  }) {
    String url = \"\";
    switch (urlEnum) {
      case HttpBaseUrlEnum.normalUrl:
        url = \"https://api.apiopen.top/api\";
        break;
      case HttpBaseUrlEnum.otherUrl:
        url = \"https://api.apiopen.top/api\";
        break;
      default:
    }
    return url;
  }
}
"

# 创建默认配置项
cr_normal_config="
class NormalConfig {}
"

# 创建界面ID配置项
cr_page_id_config="
class PageIdConfig {
  static const String index = '/index';
}
"

# ======================= 路由 ======================= #
: <<!
!

cr_routers="
class RouterS {
  static getAllRoutS() {
    return [];
  }
  // 设置默认入口页
  static configNoramlRouts() {
    return "";
  }
}
"
cr_routers_normal="
import 'package:get/get.dart';
import '../../init/init_index.dart';
import '../dataconfig/page_id_config.dart';

class RouterS {
  static getAllRoutS() {
    return [
      GetPage(
        name: PageIdConfig.index,
        page: () => const MyHomePage(
          title: \"title\",
        ),
      )
    ];
  }

  // 设置默认入口页
  static configNoramlRouts() {
    return PageIdConfig.index;
  }
}
"
cr_routers_plus="
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../init/init_index.dart';
import '../dataconfig/page_id_config.dart';

class RouterS {
  static getAllRoutS() {
    return [
      GetPage(
        name: PageIdConfig.index,
        page: () => const MyHomePage(
          title: \"title\",
        ),
      )
    ];
  }

  // 设置默认入口页
  static configNoramlRouts() {
    return PageIdConfig.index;
  }
}
"
cr_routers_plus="
import '/pages/tuchong_module/routers/routers_index.dart';

class RouterS {
  static getAllRoutS() {
    return [
      ...TuchongModulePages.routers,
    ];
  }

  // 设置默认入口页
  static configNoramlRouts() {
    return TuchongModuleRouters.initalRoute;
  }
}

"
cr_routers_pro="
import 'package:hzy_example_module/hzy_example_module/routers/routers_index.dart';
import '/config/dataconfig/page_id_config.dart';

class RouterS {
  static getAllRoutS() {
    return [
      ...ExampleModulePageS.routerS,
    ];
  }

  // 设置默认入口页
  static configNoramlRouts() {
    return PageIdConfig.index;
  }
}
"

# ============== 修改 Test 文件内容 ============== #
cr_test="
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(initRunApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
"
