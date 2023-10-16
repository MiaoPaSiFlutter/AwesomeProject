import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/31.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

//定义登录页面
class TestCommonLoginPage extends StatefulWidget {
  const TestCommonLoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<TestCommonLoginPage> {
  //RichText 富文本中使用的手势识别
  late TapGestureRecognizer _gestureRecognizer;
  late TapGestureRecognizer _gestureRecognizer2;

  @override
  void initState() {
    super.initState();
    _gestureRecognizer = TapGestureRecognizer();
    _gestureRecognizer2 = TapGestureRecognizer();
  }

  @override
  void dispose() {
    super.dispose();
    _gestureRecognizer.dispose();
    _gestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景颜色
      backgroundColor: Colors.white,
      //构建APPBar
      appBar: buildAppBar(),
      //内容主体
      body: Container(
        //填充屏幕空间
        width: double.infinity,
        height: double.infinity,
        child: buildColumn(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        const SizedBox(height: 44),
        Image.asset(
            NormalModuleUtils.configPackagesImage(
              packagename: 'common_demo',
              name: "assets/app_icon.png",
            ),
            width: 60,
            height: 60),
        const SizedBox(height: 24),
        const Text("欢迎登录 精彩每一天", style: TextStyle(fontSize: 22)),

        //登录按钮
        buildLoginButton(),

        const SizedBox(height: 22),
        //隐私协议
        buildRichText(),
        //填充空白
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 34),
            //水平方向排开
            child: buildRow(),
          ),
        )
      ],
    );
  }

  Row buildRow() {
    return Row(
      //水平方向居中
      mainAxisAlignment: MainAxisAlignment.center,
      //竖直方向底部对齐
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //定义小圆圈的图标按钮
        CustumOvalButton(
          iconData: Icons.app_blocking,
          clickCallBack: () {
            print("点击 了手机");
          },
        ),
        const SizedBox(
          width: 22,
        ),
        CustumOvalButton(
          iconData: Icons.android_rounded,
          clickCallBack: () {
            print("点击 了Android ");
          },
        ),
        const SizedBox(
          width: 22,
        ),
        CustumOvalButton(
          iconData: Icons.more_horiz_outlined,
          clickCallBack: () {
            print("点击 更多");
          },
        ),
      ],
    );
  }

  Container buildLoginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 64),
      color: Colors.blue,
      width: 220,
      height: 44,
      child: InkWell(
        onTap: () {
          print("点击了手机号登录");
        },
        child: const Center(
          child: Text(
            "手机号一键登录",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  //封装方法
  RichText buildRichText() {
    return RichText(
      text: TextSpan(
          text: "登录同意",
          style: const TextStyle(color: Colors.grey),
          children: [
            TextSpan(
                text: "用户协议",
                style: const TextStyle(
                  color: Colors.orange,
                ),
                //点击事件
                recognizer: _gestureRecognizer
                  ..onTap = () {
                    print("用户协议点击");
                  }),
            const TextSpan(
              text: "和",
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
                text: "隐私协议",
                style: const TextStyle(
                  color: Colors.orange,
                ),
                //点击事件
                recognizer: _gestureRecognizer2
                  ..onTap = () {
                    print("隐私协议点击");
                  }),
          ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      //阴影高度
      elevation: 0.0,
      //左侧的按钮
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_outlined),
        onPressed: () {
          print("返回键点击 ");
        },
      ),
      //右侧的按钮
      actions: [
        InkWell(
          child: const Center(child: Text("登录遇到问题")),
          onTap: () {},
        )
      ],
    );
  }
}

class CustumOvalButton extends StatefulWidget {
  //图标
  final IconData? iconData;

  //点击事件回调
  final Function()? clickCallBack;

  CustumOvalButton({
    Key? key,
    required this.iconData,
    this.clickCallBack,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustumOvalButtonState();
  }
}

class _CustumOvalButtonState extends State<CustumOvalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //点击事件的响应范围
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      //点击事件
      onTap: widget.clickCallBack,
      child: Container(
        width: 50,
        height: 50,
        //自定义边框
        decoration: BoxDecoration(
            //边框
            border: Border.all(color: Colors.grey),
            //边框圆角
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Icon(
          widget.iconData,
          //图标颜色
          color: Colors.black87,
        ),
      ),
    );
  }
}
