### [【国际化 Intl】Flutter 国际化多语言实践](https://blog.csdn.net/daddykei/article/details/128124815)

#### 第一步，添加 intl and flutter_localizations，并启动 generate 标志：

```
# 国际化
dependencies:
  # 国际化
  flutter_localizations:
    sdk: flutter
  flutter:
    sdk: flutter

flutter:
  uses-material-design: true
  # Enable generation of localized Strings from arb files.
  generate: true
```

#### 第二步，lib 文件夹中新建文件夹 l10n 或者 locale，并在其中创建 app_en.arb 和 app_zh.arb 文件：

本 package 中是新建文件夹 `localization`
具体文件路径：`flutter_black_hole/flutter_black_hole/pages/localization`

#### 第三步，在 flutte 项目的根目录中添加 l10n.yaml, 内容如下：

```
arb-dir: lib/flutter_black_hole/pages/localization
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

添加完成之后，执行命令 flutter run，dart_tools 会自动生成相关的文件。
注意：生成的 dart_tools 需要删除，否则会报错(注意，删除前需要把 dart_tools/flutter_gen 目录拷贝到 flutter_black_hole/flutter_black_hole/pages/flutter_gen)。

#### 第四步，在主程序 MaterialApp 中，添加下面内容：

```
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

return const MaterialApp(
  title: 'Localizations Sample App',
  localizationsDelegates: [							// 本地化应用的代理
    AppLocalizations.delegate,  					// 应用程序本地化代理
    GlobalMaterialLocalizations.delegate, 			// 全局材质组件的本地化代理
    GlobalWidgetsLocalizations.delegate,			// 全局组件本地化代理
  ],
  supportedLocales: [
    Locale('en', 'US'), // English, no country code
    Locale('zh', 'CN'), // Spanish, no country code
  ],
  home: MyHomePage(),
);

```

#### 第五步，具体使用

在您的应用程序的任何位置使用 AppLocalizations。 在这里，翻译后的消息用于文本小部件。
Use AppLocalizations anywhere in your app. Here, the translated message is used in a Text widget.

```
Text(AppLocalizations.of(context)!.helloWorld);
```

版权声明：本文为 CSDN 博主「ThinkerWing」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/daddykei/article/details/128124815
