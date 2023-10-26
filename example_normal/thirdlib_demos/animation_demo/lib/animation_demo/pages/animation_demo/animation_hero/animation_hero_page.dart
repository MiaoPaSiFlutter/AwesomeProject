import 'package:animation_demo/animation_demo.dart';
import 'package:flutter/material.dart';

//Hero动画
class AnimationHeroPage extends StatefulWidget {
  const AnimationHeroPage({super.key});

  @override
  State createState() => _AnimationHeroPageState();
}

class _AnimationHeroPageState extends State<AnimationHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景
      backgroundColor: Colors.grey[200],
      //标题
      appBar: AppBar(title: const Text("每日分享")),
      //页面主体
      body: buildBodyWidget(),
    );
  }

  Widget buildBodyWidget() {
    //水波纹点击事件监听
    return InkWell(
      //手指点击抬起时的回调
      onTap: () {
        //打开新的页面
        openPageFunction();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        //线性布局左右排列
        child: Row(
          //主轴方向开始对齐 在这里是左对齐
          mainAxisAlignment: MainAxisAlignment.start,
          //交叉轴上开始对齐 在这里是顶部对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //左侧的图片
            buildLeftImage(),
            //右侧的文本区域
            buildRightTextArea()
          ],
        ),
      ),
    );
  }

  ///左侧的图片区域
  Container buildLeftImage() {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Hero(
        tag: "test",
        child: Image.asset(
          Utils.assets("images/banner3.webp"),
          width: 96,
          fit: BoxFit.fill,
          height: 96,
        ),
      ),
    );
  }

  ///右侧的文本区域
  Expanded buildRightTextArea() {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "优美的应用",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "优美的应用体验 来自于细节的处理，更源自于码农的自我要求与努力，当然也需要码农年轻灵活的思维。",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(fontSize: 14, color: Colors.black38),
          )
        ],
      ),
    );
  }

  ///自定义路由动画
  void openPageFunction() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          //目标页面
          return const DetailsPage();
        },
        //打开新的页面用时
        transitionDuration: const Duration(milliseconds: 1800),
        //关半页岩用时
        reverseTransitionDuration: const Duration(milliseconds: 1800),
        //过渡动画构建
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          //渐变过渡动画
          return FadeTransition(
            // 透明度从 0.0-1.0
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                //动画曲线规则，这里使用的是先快后慢
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景透明
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("精彩人生"),
      ),
      body: buildCurrentWidget(context),
    );
  }

  Widget buildCurrentWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //图片区域
          buildHero(context),
          const SizedBox(width: 22),
          //文字区域
          buildTextContainer(),
        ],
      ),
    );
  }

  ///图片区域
  Hero buildHero(BuildContext context) {
    return Hero(
      tag: "test",
      child: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            Utils.assets("images/banner3.webp"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Container buildTextContainer() {
    return Container(
      child: const Text(
        "优美的应用体验 来自于细节的处理，更源自于码农的自我要求与努力",
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
