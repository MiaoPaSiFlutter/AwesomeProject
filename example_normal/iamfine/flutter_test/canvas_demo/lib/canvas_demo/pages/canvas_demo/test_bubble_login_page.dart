import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

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
/// 气泡背景的登录页面

///获取随机颜色
Color getRandonColor(Random random) {
  var a = random.nextInt(255);
  var r = random.nextInt(255);
  var g = random.nextInt(255);
  var b = random.nextInt(255);
  return Color.fromARGB(a, r, g, b);
}

///获取随机透明的白色
Color getRandonWhightColor(Random random) {
  //0~255 0为完全透明 255 为不透明
  //这里生成的透明度取值范围为 10~200
  int a = random.nextInt(190) + 10;
  return Color.fromARGB(a, 255, 255, 255);
}

///计算坐标
Offset calculateXY(double speed, double theta) {
  return Offset(speed * cos(theta), speed * sin(theta));
}

class BobbleLoginPage extends StatefulWidget {
  const BobbleLoginPage({super.key});

  @override
  _BobbleLoginPageState createState() => _BobbleLoginPageState();
}

class _BobbleLoginPageState extends State<BobbleLoginPage>
    with TickerProviderStateMixin {
  //创建的气泡保存集合
  final List<BobbleBean> _list = [];

  //随机数据
  final Random _random = Random(DateTime.now().microsecondsSinceEpoch);

  //气泡的最大半径
  double maxRadius = 100;

  //气泡动画的最大速度
  double maxSpeed = 0.7;

  //气泡计算使用的最大弧度（360度）
  double maxTheta = 2.0 * pi;

  //动画控制器
  AnimationController? _animationController;

  //流控制器
  final StreamController<double> _streamController = StreamController();

  AnimationController? _fadeAnimationController;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 20; i++) {
      BobbleBean particle = BobbleBean();
      //获取随机透明度的白色颜色
      particle.color = getRandonWhightColor(_random);
      //指定一个位置 每次绘制时还会修改
      particle.postion = const Offset(-1, -1);
      //气泡运动速度
      particle.speed = _random.nextDouble() * maxSpeed;
      //随机角度
      particle.theta = _random.nextDouble() * maxTheta;
      //随机半径
      particle.radius = _random.nextDouble() * maxRadius;
      //集合保存
      _list.add(particle);
    }

    //动画控制器
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    //刷新监听
    _animationController?.addListener(() {
      //流更新
      _streamController.add(0.0);
    });

    _fadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _fadeAnimationController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //重复执行动画
        _animationController?.repeat();
      }
    });
    //重复执行动画
    _fadeAnimationController?.forward();
  }

  @override
  void dispose() {
    //销毁
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///填充布局
      body: Stack(
        children: [
          //第一部分 第一层 渐变背景
          buildBackground(),
          //第二部分 第二层 气泡
          buildBubble(context),
          //第三部分 高斯模糊
          buildBlureWidget(),
          //第四部分 顶部的文字
          buildTopText(),
          //第五部分 输入框与按钮
          FadeTransition(
            opacity: _fadeAnimationController!,
            child: buildColumn(context),
          ),
        ],
      ),
    );
  }

//第四部分 顶部的文字
  Positioned buildTopText() {
    //顶部对齐
    return const Positioned(
      top: 120,
      left: 0,
      right: 0,
      child: Text(
        'Holl World',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 40.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  //第二部分 第二层 气泡
  Widget buildBubble(BuildContext context) {
    //使用Stream流实现局部更新
    return StreamBuilder<double>(
      stream: _streamController.stream,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        //自定义画板
        return CustomPaint(
          //自定义画布
          painter: CustomMyPainter(
            list: _list,
            random: _random,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
          ),
        );
      },
    );
  }

  //第一部分 第一层 渐变背景
  Container buildBackground() {
    return Container(
      decoration: BoxDecoration(
        //线性渐变
        gradient: LinearGradient(
          //渐变角度
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //渐变颜色组
          colors: [
            Colors.lightBlue.withOpacity(0.3),
            Colors.lightBlueAccent.withOpacity(0.3),
            Colors.blue.withOpacity(0.3),
          ],
        ),
      ),
    );
  }

  //第一部分 图片背景
  buildImage() {
    return Positioned.fill(
      child: Image.asset(
        NormalModuleUtils.configPackagesImage(
            packagename: 'canvas_demo', name: 'assets/welcome_bg.jpeg'),
        fit: BoxFit.fill,
      ),
    );
  }

  //第三部分 高斯模糊
  buildBlureWidget() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
      child: Container(
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }

  //第五部分 输入框与按钮
  Widget buildColumn(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(44),
      child: Column(
        //子Widget 底部对齐
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextFieldWidget(
            hintText: '邮箱',
            obscureText: false,
            prefixIconData: Icons.mail_outline,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFieldWidget(
                hintText: '密码',
                obscureText: true,
                prefixIconData: Icons.lock_outline,
                suffixIconData: Icons.visibility,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '忘记密码?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          ButtonWidget(
            buttonLabel: '登录',
            onTap: () {},
            hasBorder: false,
          ),
          const SizedBox(
            height: 10.0,
          ),
          ButtonWidget(
            buttonLabel: '跳过',
            onTap: () {},
            hasBorder: true,
          ),
        ],
      ),
    );
  }
}

class CustomMyPainter extends CustomPainter {
  //创建画笔
  final Paint _paint = Paint();

  //保存气泡的集合
  List<BobbleBean> list;

  //随机数变量
  Random random;

  CustomMyPainter({required this.list, required this.random});

  @override
  void paint(Canvas canvas, Size size) {
    //每次绘制都重新计算位置
    for (var element in list) {
      //计算偏移
      var velocity = calculateXY(element.speed, element.theta);
      //新的坐标 微偏移
      var dx = element.postion.dx + velocity.dx;
      var dy = element.postion.dy + velocity.dy;
      //x轴边界计算
      if (element.postion.dx < 0 || element.postion.dx > size.width) {
        dx = random.nextDouble() * size.width;
      }
      //y轴边界计算
      if (element.postion.dy < 0 || element.postion.dy > size.height) {
        dy = random.nextDouble() * size.height;
      }
      //新的位置
      element.postion = Offset(dx, dy);

      print("dx $dx dy $dy  ${element.postion}");
    }

    //循环绘制所有的气泡
    for (var element in list) {
      //画笔颜色
      _paint.color = element.color;
      //绘制圆
      canvas.drawCircle(element.postion, element.radius, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///气泡属性配置
class BobbleBean {
  //位置
  late Offset postion;

  //颜色
  late Color color;

  //运动的速度
  late double speed;

  //角度
  late double theta;

  //半径
  late double radius;
}

///自定义文本输入框
class TextFieldWidget extends StatelessWidget {
  //占位提示文本
  final String? hintText;
  //输入框前置图标
  final IconData? prefixIconData;
  //输入框后置图标
  final IconData? suffixIconData;
  //是否隐藏文本
  final bool obscureText;
  //输入实时回调
  final Function(String)? onChanged;

  TextFieldWidget({
    Key? key,
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //构建输入框
    return TextField(
      //实时输入回调
      onChanged: onChanged,
      //是否隐藏文本
      obscureText: obscureText,
      //隐藏文本小圆点的颜色
      cursorColor: Theme.of(context).colorScheme.secondary,
      //文本样式
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 14.0,
      ),
      //输入框的边框
      decoration: InputDecoration(
        //提示文本
        labelText: hintText,
        //提示文本的样式
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        //可编辑时的提示文本的颜色
        focusColor: Theme.of(context).colorScheme.secondary,
        //填充
        filled: true,
        //可编辑时 无边框样式
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),

        //获取输入焦点时的边框样式
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),

        //文本前置的图标
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
        //文本后置的图标
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            suffixIconData,
            size: 18,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

///自定义按钮
class ButtonWidget extends StatelessWidget {
  //按钮上的文字
  final String buttonLabel;
  //是否填充背景
  final bool hasBorder;
  //点击事件回调
  final GestureTapCallback? onTap;

  ButtonWidget({
    Key? key,
    required this.buttonLabel,
    this.hasBorder = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        //边框
        decoration: BoxDecoration(
          //定义填充颜色
          color: hasBorder
              ? Colors.white
              : Theme.of(context).colorScheme.secondary,
          //点击事件高亮的边框圆角
          borderRadius: BorderRadius.circular(10),
          //边框设置
          border: hasBorder
              ? Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1.0,
                )
              : const Border.fromBorderSide(BorderSide.none),
        ),
        //事件监听回调
        child: buildInkWell(context),
      ),
    );
  }

  InkWell buildInkWell(BuildContext context) {
    return InkWell(
      //事件回调
      onTap: onTap,
      //点击的水波纹与高亮颜色 与Ink设置的背景圆角一致
      borderRadius: BorderRadius.circular(10),
      //按钮样式
      child: Container(
        height: 60.0,
        child: Center(
          child: Text(
            //文本内容
            buttonLabel,
            //文本样式
            style: TextStyle(
              //文本颜色
              color: hasBorder
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.white,
              //加粗
              fontWeight: FontWeight.w600,
              //文字大小
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
