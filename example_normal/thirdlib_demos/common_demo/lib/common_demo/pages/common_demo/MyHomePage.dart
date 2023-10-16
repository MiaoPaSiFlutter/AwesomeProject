import 'package:flutter/material.dart';
import 'BottomNavBarV1Demo.dart';
import 'clip/test_clip_oval_page.dart';
import 'clip/test_clip_react_page.dart';
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
import 'TestShakeAnimationPage.dart';
import 'TestShakeAnimationPage2.dart';
import 'LiquidSwipeDemo1.dart';
import 'TestTabBarHomePage.dart';
import 'AnimationSshowModalHomePage.dart';
import 'TestNestedScrollViewUse1.dart';

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
            createCommonItem("自定义 BottomNavBar", const BottomNavBarV1Demo()),
            createCommonItem("抽屉", const CustomDrawer()),
            createCommonItem("测试 横竖屏切换", const TestOrientationPage()),
            createCommonItem("测试 轮播图", const SlideBannerPage()),
            createCommonItem("时钟动画", const TestClockPage()),
            createCommonItem("测试 登录页", const TestCommonLoginPage()),
            createCommonItem("测试 Float-Hero", const TestFloatHeroPage()),
            createCommonItem("测试 页面切换", const LiquidSwipeDemo1()),
            createCommonItem("裁剪 组件测试 1", const TestClipOvalPage()),
            createCommonItem("裁剪 组件测试 2", const TestClipReactPage()),
            createCommonItem("圆角图标", const TestRuondIconPage()),
            createCommonItem("List View 局部更新", const TestListPartPage()),
            createCommonItem("Tab 测试", TestTabBarHomePage()),
            createCommonItem("测试  模态动画", const AnimationSshowModalHomePage()),
            createCommonItem("图片浏览", const AnimationOpenContainerPage()),
            createCommonItem(
                "shake_animation 1", const TestShakeAnimationPage()),
            createCommonItem(
                "shake_animation 2", const TestShakeAnimationPage2()),
            createCommonItem(
                "NestedScrollViewUse 1", const TestNestedScrollViewUse1()),
            createCommonItem("倒计时", TestTimeProgressIndicatorPage()),
          ],
        ),
      ),
    );
  }

  Widget createCommonItem(String text, Widget nextWidget) {
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
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
