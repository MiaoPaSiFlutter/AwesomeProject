import 'package:flutter/material.dart';
import 'BottomNavBarV1Demo.dart';
import 'Provider/ChangeNotifierProvider使用/UserChangeNotifierProviderScreen.dart';
import 'Provider/FutureProvider使用/UserFutureProviderScreen.dart';
import 'Provider/ListenableProvider使用/UserListenableProviderScreen.dart';
import 'Provider/MVVM/UserMVVMProviderScreen.dart';
import 'Provider/MultiProvider使用/UserMultiProviderScreen.dart';
import 'Provider/Provider使用/UserProviderScreen.dart';
import 'Provider/ProxyProvider使用/UserProxyProviderScreen.dart';
import 'Provider/StreamProvider使用/UserStreamProviderScreen.dart';
import 'Provider/ValueListenableProvider使用/UserValueListenableProviderScreen.dart';
import 'clip/test_clip_page.dart';
import 'customDrawer/CustomDrawer.dart';
import 'icon/test_round_icon_page.dart';
import 'listview/test_list_part_page.dart';
import 'SlideBannerPage.dart';
import 'AnimationOpenContainerPage.dart';
import 'TestClockPage.dart';
import 'TestCommonLoginPage.dart';
import 'TestFloatHeroPage.dart';
import 'TestOrientationPage.dart';
import 'TestTimeProgressIndicatorPage.dart';
import 'LiquidSwipeDemo1.dart';
import 'TestTabBarHomePage.dart';
import 'AnimationSshowModalHomePage.dart';
import 'TestNestedScrollViewUse1.dart';
import 'shake_animation/TestShakeAnimationPage.dart';
import 'shake_animation/TestShakeAnimationPage2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
