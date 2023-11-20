import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'common_demo/BottomNavBarV1Demo.dart';
import 'common_demo/Provider/ChangeNotifierProvider使用/UserChangeNotifierProviderScreen.dart';
import 'common_demo/Provider/FutureProvider使用/UserFutureProviderScreen.dart';
import 'common_demo/Provider/ListenableProvider使用/UserListenableProviderScreen.dart';
import 'common_demo/Provider/MVVM/UserMVVMProviderScreen.dart';
import 'common_demo/Provider/MultiProvider使用/UserMultiProviderScreen.dart';
import 'common_demo/Provider/Provider使用/UserProviderScreen.dart';
import 'common_demo/Provider/ProxyProvider使用/UserProxyProviderScreen.dart';
import 'common_demo/Provider/StreamProvider使用/UserStreamProviderScreen.dart';
import 'common_demo/Provider/ValueListenableProvider使用/UserValueListenableProviderScreen.dart';
import 'common_demo/clip/test_clip_page.dart';
import 'common_demo/customDrawer/CustomDrawer.dart';
import 'common_demo/icon/test_round_icon_page.dart';
import 'common_demo/listview/test_list_part_page.dart';
import 'common_demo/SlideBannerPage.dart';
import 'common_demo/AnimationOpenContainerPage.dart';
import 'common_demo/TestClockPage.dart';
import 'common_demo/TestCommonLoginPage.dart';
import 'common_demo/TestFloatHeroPage.dart';
import 'common_demo/TestOrientationPage.dart';
import 'common_demo/TestTimeProgressIndicatorPage.dart';
import 'common_demo/LiquidSwipeDemo1.dart';
import 'common_demo/TestTabBarHomePage.dart';
import 'common_demo/AnimationSshowModalHomePage.dart';
import 'common_demo/TestNestedScrollViewUse1.dart';
import 'common_demo/shake_animation/TestShakeAnimationPage.dart';
import 'common_demo/shake_animation/TestShakeAnimationPage2.dart';

class TestCommonApp extends GetView<TestCommonAppController> {
  const TestCommonApp({super.key});

  @override
  TestCommonAppController get controller => Get.put(TestCommonAppController());

  @override
  Widget build(BuildContext context) {
    return const MyAppWrapper();
  }
}

class TestCommonAppController extends GetxController {
  TestCommonAppController();

  /// give access to currentContext
  BuildContext? get context => Get.context;
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({super.key});

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test - Common',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ..._buildProviderUseList(),
            createSectionTitle('shake_animation'),
            createCommonItem(
                "shake_animation 1", const TestShakeAnimationPage()),
            createCommonItem(
                "shake_animation 2", const TestShakeAnimationPage2()),
            createSectionTitle('横竖屏切换'),
            createCommonItem("测试 横竖屏切换", const TestOrientationPage()),
            createSectionTitle('其他'),
            createCommonItem("自定义 BottomNavBar", const BottomNavBarV1Demo()),
            createCommonItem("抽屉", const CustomDrawer()),
            createCommonItem("测试 轮播图", const SlideBannerPage()),
            createCommonItem("时钟动画", const TestClockPage()),
            createCommonItem("测试 登录页", const TestCommonLoginPage()),
            createCommonItem("测试 Float-Hero", const TestFloatHeroPage()),
            createCommonItem("测试 页面切换", const LiquidSwipeDemo1()),
            createCommonItem("裁剪 组件测试", const TestClipPage()),
            createCommonItem("圆角图标", const TestRuondIconPage()),
            createCommonItem("List View 局部更新", const TestListPartPage()),
            createCommonItem("Tab 测试", TestTabBarHomePage()),
            createCommonItem("测试  模态动画", const AnimationSshowModalHomePage()),
            createCommonItem("图片浏览", const AnimationOpenContainerPage()),
            createCommonItem(
                "NestedScrollViewUse 1", const TestNestedScrollViewUse1()),
            createCommonItem("倒计时", TestTimeProgressIndicatorPage()),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildProviderUseList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('Provider使用'),
      createCommonItem("Provider使用", UserProviderScreen()),
      createCommonItem("ProxyProvider使用", UserProxyProviderScreen()),
      createCommonItem("StreamProvider使用", UserStreamProviderScreen()),
      createCommonItem(
          "ValueListenableProvider使用", UserValueListenableProviderScreen()),
      createCommonItem(
          "ChangeNotifierProvider使用", UserChangeNotifierProviderScreen()),
      createCommonItem("FutureProvider使用", UserFutureProviderScreen()),
      createCommonItem("ListenableProvider使用", UserListenableProviderScreen()),
      createCommonItem("MultiProvider使用", UserMultiProviderScreen()),
      createCommonItem("Provider-MVVM使用", UserMVVMProviderScreen()),
    ]);
    return list;
  }

  Widget createSectionTitle(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      color: Colors.blueAccent,
      child: Text("🔥$text"),
    );
  }

  Widget createCommonItem(String text, Widget nextWidget) {
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Text(text),
      ),
      onTap: () {
        //OrientationBuilder
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return nextWidget;
        }));
      },
    );
  }
}
