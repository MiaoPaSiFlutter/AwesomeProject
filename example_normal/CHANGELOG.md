### 2023-10-18

#### 1、[添加 web 支持](https://docs.flutter.dev/platform-integration/web/building)

This application is not configured to build on the web.
To add web support to a project, run `flutter create .`.

运行 `flutter create .` 会创建 web 文件夹
运行 `flutter run -d chrome` 运行到 Chrome

#### 2、[ Flutter Web 预览时白屏解决方法 ](https://www.cnblogs.com/letleon/p/16869746.html)

原因是因为运行 flutter run 是自动选择渲染器

--- 桌面端 WEB 浏览器默认使用 CanvasKit 渲染器

--- 移动端 WEB 浏览器默认使用 HTML 渲染器

问题就出在了 CanvasKit 渲染器,他需要下载一些库的支持，

解决方法：

```javascript：
1：挂梯子
2：改渲染器
　　2.1：在命令行中指定渲染器（每次都得敲命令,run 和 build 都可用）
　　　　　　HTML渲染器
　　　　　　　　flutter run -d chrome --web-renderer html

　　　　　　CANVASKIT渲染器（默认 flutter run -d chrome 就是这个）
　　　　　　　　flutter build web --web-renderer canvaskit

　　2.2:在WEB index.html 中设置渲染器（只需要修改一次）
　　　　　　在 web/index.html 文件中，main.dart.js 之前加入一个 <script>
复制代码

<!-- 渲染模式 -->
<script type="text/javascript">
   let useHtml = true;//你懂的
   if(useHtml) {
     window.flutterWebRenderer = "html";
   } else {
     window.flutterWebRenderer = "canvaskit";
   }
 </script>
<!--  在main.dart.js之前 -->
<!--  <script src="main.dart.js" type="application/javascript"></script> -->
```

### 2023-10-17

1、[使用 flutter_launcher_icons 修改程序的图标](https://github.com/fluttercommunity/flutter_launcher_icons/)

# 一个软件包，可简化更新 Flutter 应用程序启动器图标的任务。

flutter_launcher_icons: ^0.13.1

2、[使用 package_rename 修改包名。](https://github.com/OutdatedGuy/package_rename/tree/main)
package_rename: ^1.3.3

### 2023-10-16

1、创建 extended_sliver_demo 模块儿
sh hzy_rob_project.sh -n extended_sliver_demo -l pro -t package

2、创建 scrollerview_demo 模块儿
sh hzy_rob_project.sh -n scrollerview_demo -l pro -t package

3、创建 animation_demo 模块儿
sh hzy_rob_project.sh -n animation_demo -l pro -t package

4、创建 canvas_demo 模块儿
sh hzy_rob_project.sh -n canvas_demo -l pro -t package

5、创建 common_demo 模块儿
sh hzy_rob_project.sh -n common_demo -l pro -t package

### 2023-10-15

1、创建 京东 模块儿
sh hzy_rob_project.sh -n demo_jingdong -l pro -t package

2、添加京东登录页面

### 2023-10-14

1、补充自动化脚本

### 2023-10-13

Xcode14.2
Flutter SDK:3.13.7
1、固定 pubspec.yaml 中三方库的版本号

### 2023-10-12

项目初始化
Xcode13.2
Flutter SDK:3.10.0
