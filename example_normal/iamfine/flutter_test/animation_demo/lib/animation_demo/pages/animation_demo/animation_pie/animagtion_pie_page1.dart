import 'dart:math';
import 'package:flutter/material.dart';

//定义一个全局的内容主颜色
Color mainColor = const Color(0xFFCADCED);

///默认显示的首页面
class AnimagtionPiePage1 extends StatefulWidget {
  const AnimagtionPiePage1({super.key});

  @override
  State createState() => _AnimagtionPiePage1State();
}

class _AnimagtionPiePage1State extends State<AnimagtionPiePage1>
    with SingleTickerProviderStateMixin {
  //来个动画控制器
  late AnimationController _animationController;

  //控制背景抬高使用的
  late Animation<double> _bgAnimation;

  //控制饼图使用的
  late Animation<double> _progressAnimation;

  //控制数字使用的
  late Animation<double> _numberAnimation;

  @override
  void initState() {
    super.initState();

    //初始化一下
    _animationController = AnimationController(
        //执行时间为 1 秒
        duration: const Duration(milliseconds: 1000),
        vsync: this);

    //在 0~500毫秒内 执行背景阴影抬高的操作
    _bgAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        //执行时间 区间
        curve: const Interval(0.0, 0.5, curve: Curves.bounceOut),
      ),
    );

    //在 400 ~ 800 毫秒的区间内执行画饼的操作动画
    _progressAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        //执行时间 区间
        curve: const Interval(0.4, 0.8, curve: Curves.bounceOut),
      ),
    );

    //在 700 ~ 1000 毫秒的区间 执行最上层的数字抬高的操作动画
    _numberAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        //执行时间 区间
        curve: const Interval(0.7, 1.0, curve: Curves.bounceOut),
      ),
    );

    //添加 一个监听 刷新页面
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //页面的主内容 先来个居中
      body: Center(
        child: Container(
          //来个高度
          height: 260,
          //宽度填充
          width: MediaQuery.of(context).size.width,
          //设置一下背景
          color: mainColor,
          //封装一个方法构建左右排列的
          child: buildRow(),
        ),
      ),
      //右下角的悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //点击按钮开启动画
          _animationController.reset();
          _animationController.forward();
        },
      ),
    );
  }

  buildRow() {
    //左右排列的线性布局
    return Row(
      children: [
        //权重适配 占用宽度 5：6
        Expanded(
          flex: 5,
          //左边是一个竖直方向排列的线性布局
          child: buildLeftColumn(),
        ),
        //右边就是饼图区域
        Expanded(
          flex: 6,
          //层叠布局
          child: buildRightStack(),
        ),
      ],
    );
  }

  Stack buildRightStack() {
    return Stack(
      //子 Widget 居中
      alignment: Alignment.center,
      children: [
        //第一层
        Container(
          //来个内边距
          padding: const EdgeInsets.all(22),
          //来个边框装饰
          decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
              //来个阴影
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: -8 * _bgAnimation.value,
                  offset:
                      Offset(-5 * _bgAnimation.value, -5 * _bgAnimation.value),
                  blurRadius: 30 * _bgAnimation.value,
                ),
                BoxShadow(
                  //模糊颜色
                  color: Colors.blue[300]!.withOpacity(0.3),
                  //模糊半径
                  spreadRadius: 2 * _bgAnimation.value,
                  //阴影偏移量
                  offset:
                      Offset(5 * _bgAnimation.value, 5 * _bgAnimation.value),
                  //模糊度
                  blurRadius: 20 * _bgAnimation.value,
                ),
              ]),
          //开始绘制神操作
          child: CustomPaint(
            size: const Size(200, 200),
            painter: CustomShapPainter(_list, _progressAnimation.value),
          ),
        ),
        //第二层
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: mainColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3 * _numberAnimation.value,
                  blurRadius: 5 * _numberAnimation.value,
                  offset: Offset(
                      5 * _numberAnimation.value, 5 * _numberAnimation.value),
                  color: Colors.black54),
            ],
          ),
          child: const Center(
            child: Text(
              "￥100",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ],
    );
  }

  //定义数据模型
  final List _list = [
    {"title": "生活费", "number": 200, "color": Colors.lightBlueAccent},
    {"title": "交通费", "number": 200, "color": Colors.green},
    {"title": "贷款费", "number": 400, "color": Colors.amber},
    {"title": "游玩费", "number": 100, "color": Colors.orange},
    {"title": "电话费", "number": 100, "color": Colors.deepOrangeAccent},
  ];

  //左边
  Column buildLeftColumn() {
    return Column(
      //设置包裹子Widget
      mainAxisSize: MainAxisSize.min,
      //图例排列
      children: _list.map(
        (data) {
          return Container(
            //设置左右上下边距
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: data["color"],
                    shape: BoxShape.circle,
                  ),
                  width: 10,
                  height: 10,
                ),
                Text(
                  data["title"],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}

//你可以将这些类封装成不同的类文件 在这里小编为提供 Demo 的方便所以写在一起了

class CustomShapPainter extends CustomPainter {
  //数据内容
  List list;

  double progress;

  CustomShapPainter(this.list, this.progress);

  //来个画笔
  final Paint _paint = Paint()..isAntiAlias = true;

  //圆周率（Pi）是圆的周长与直径的比值，一般用希腊字母π表示
  //绘制内容
  @override
  void paint(Canvas canvas, Size size) {
    //中心
    Offset center = Offset(size.width / 2, size.height / 2);
    //半径  取宽高 一半 最小值
    double radius = min(size.width / 2, size.height / 2);

    //开始绘制的弧度
    double startRadian = -pi / 2;

    //总金额
    double total = 0.0;
    for (var element in list) {
      total += element["number"];
    }

    //开始绘制
    for (var i = 0; i < list.length; i++) {
      //当前要绘制的选项
      var item = list[i];

      //计算所占的比例
      double flag = item["number"] / total;

      //计算弧度
      double sweepRadin = flag * 2 * pi * progress;

      //开始绘制弧
      //设置一下画笔的颜色
      _paint.color = item["color"];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadin, true, _paint);

      //累加下次开始绘制的角度
      startRadian += sweepRadin;
    }
  }

  //返回true 刷新
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
