import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/22.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
/// 知乎 https://www.zhihu.com/people/zhao-long-90-89
///
///
class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage2>
    with SingleTickerProviderStateMixin {
  //定义动画控制器
  AnimationController? _animationController;

  Animation<double>? _animation;

  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        //动画时间 3 秒
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    //动画刷新监听
    _animationController?.addListener(() {
      setState(() {});
    });

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.bounceInOut));

    _slideAnimation =
        Tween(begin: const Offset(0, -0.5), end: const Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _animationController!, curve: Curves.bounceInOut));

    //开启动画
    _animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //层叠布局
        child: Stack(
          children: [
            //第一部分 底部的内容
            buildBottomMenu(),
            //第二部分 按钮
            buildButtonFunction(),
            //第三部分 文字
            buldText(),
          ],
        ),
      ),
    );
  }

  buildBottomMenu() {
    return Positioned(
      height: 62,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        child: CustomPaint(
          painter: CustomMyPainter(_animation!.value),
        ),
      ),
    );
  }

  buldText() {
    return const Positioned(
      left: 0,
      right: 0,
      top: 120,
      child: Text(
        "Hello World ",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.deepOrangeAccent),
      ),
    );
  }

  //来个按钮
  buildButtonFunction() {
    return Align(
      alignment: Alignment.bottomCenter,
      //让按钮动起来
      child: SlideTransition(
        position: _slideAnimation!,
        //添加个点击事件
        child: Ink(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          //处理点击高亮的正方形
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              margin: const EdgeInsets.only(bottom: 22),
              width: 62,
              height: 62,
              //圆角
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            onTap: () {
              if (_animationController?.isCompleted == true) {
                //如果是执行完成 就反回去
                _animationController?.reverse();
              } else {
                _animationController?.reset();
                _animationController?.forward();
              }
            },
          ),
        ),
      ),
    );
  }
}

class CustomMyPainter extends CustomPainter {
  double progress;

  CustomMyPainter(this.progress);

  //创建一个画笔
  final Paint _paint = Paint()..color = Colors.orangeAccent;

  //绘制功能
  @override
  void paint(Canvas canvas, Size size) {
    //当前画布的大小
    double width = size.width;
    double height = size.height;

    //画上一个矩形
    //通过路径构建
    Path path = Path();

    //这是四条线
    //起点
    path.moveTo(0, 0);

    //开始画 三阶曲线

    //移动到起点
    path.lineTo(width / 4 + width / 8 * progress, 0);

    //曲线
    // x1, y1 控制点1
    double x1 = width / 4 + width / 8 * progress;
    double y1 = 64 * progress;

    // x2, y2 控制点2
    double x2 = width / 2 + width / 8;
    double y2 = 64 * progress;

    //终点

    double x3 = width / 2 + width * 2 / 8 - width / 8 * progress;
    double y3 = 0;

    path.cubicTo(x1, y1, x2, y2, x3, y3);

    //画线到右侧
    path.lineTo(width, 0);
    //右边线
    path.lineTo(width, height);
    //底部连线
    path.lineTo(0, height);
    //闭合 形成一个矩形
    path.close();

    //绘制
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
