import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/1.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

class TestBottomDialogPage extends StatefulWidget {
  const TestBottomDialogPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<TestBottomDialogPage> {
  String resultMessage = "--";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试底部弹框"),
      ),
      //线性布局
      //子Widget 竖直方向排开
      body: Column(
        children: [
          //一个按钮
          InkWell(
            child: const Text("点击打开弹框"),
            onTap: () {
              showBottomSheet();
            },
          ),
          //一个显示回调的文本
          Text(resultMessage),
        ],
      ),
    );
  }

  //显示底部弹框的功能
  void showBottomSheet() {
    //用于在底部打开弹框的效果
    showModalBottomSheet(
        builder: (BuildContext context) {
          //构建弹框中的内容
          return buildBottomSheetWidget(context);
        },
        context: context);
  }

  Widget buildBottomSheetWidget(BuildContext context) {
    //弹框中内容  310 的调试
    return Container(
      height: 310,
      child: Column(
        children: [
          buildItem(
              "微信登录",
              NormalModuleUtils.configPackagesImage(
                packagename: 'common_demo',
                name: "assets/wx.png",
              ), onTap: () {
            setState(() {
              resultMessage = "微信登录";
            });
          }),
          //分割线
          const Divider(),

          buildItem(
              "QQ登录",
              NormalModuleUtils.configPackagesImage(
                packagename: 'common_demo',
                name: "assets/qq.png",
              ), onTap: () {
            setState(() {
              resultMessage = "qq 登录点击";
            });
          }),

          //分割线
          const Divider(),
          buildItem(
              "天翼登录",
              NormalModuleUtils.configPackagesImage(
                packagename: 'common_demo',
                name: "assets/tianyi.png",
              ), onTap: () {
            setState(() {
              resultMessage = "天翼登录 点击";
            });
          }),
          //分割线
          const Divider(),
          buildItem("密码登录", "awesome_demo_assets/images/password.png",
              onTap: () {
            setState(() {
              resultMessage = "密码登录 点击";
            });
          }),

          Container(
            color: Colors.grey[300],
            height: 8,
          ),

          //取消按钮
          //添加个点击事件
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 44,
              alignment: Alignment.center,
              child: const Text("取消"),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(String title, String imagePath, {Function? onTap}) {
    //添加点击事件

    return InkWell(
      //点击回调
      onTap: () {
        //关闭弹框
        Navigator.of(context).pop();
        //外部回调
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 40,
        //左右排开的线性布局
        child: Row(
          //所有的子Widget 水平方向居中
          mainAxisAlignment: MainAxisAlignment.center,
          //所有的子Widget 竖直方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
