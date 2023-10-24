import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'CompassUI/CompassUI.dart';
import 'DonutAppUI/DonutAppUI.dart';
import 'EmailLoginLogoutUI/EmailLoginLogoutUI.dart';
import 'HabitTrackerUI/HabitTrackerUI.dart';
import 'MathGameUI/MathGameUI.dart';
import 'ModernSmartHomeUI/ModernSmartHomeUIApp.dart';
import 'NFTappuiUI/NFTappuiUI.dart';

class FlutterMitchkokoHomeView extends StatelessWidget {
  const FlutterMitchkokoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mitchkoko"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ..._buildCommonList(),
              ..._buildAzlistviewUseList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCommonList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('JD'),
      createCommonItem("现代智能家居 UI x Flutter", ModernSmartHomeUIApp()),
      createCommonItem("使用 Firebase 通过电子邮件登录和注销。", EmailLoginLogoutUI()),
      createCommonItem("Donut 应用程序 UI • Flutter", DonutAppUI()),
      createCommonItem("手机罗盘 • Flutter", CompassUI()),
      createCommonItem(
          "用 Flutter 制作的功能齐全的习惯追踪器应用程序！  我使用 Hive 作为本地存储后端，还使用了热图包！",
          HabitTrackerUI()),
      createCommonItem("这是一个有趣的用户界面，看起来很酷！", NFTappuiUI()),
      createCommonItem("编写数学游戏", MathGameUI()),
    ]);
    return list;
  }

  List<Widget> _buildAzlistviewUseList() {
    List<Widget> list = [];
    list.addAll([
      createSectionTitle('其他'),
    ]);
    return list;
  }
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
      Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_) {
        return nextWidget;
      }));
    },
  );
}
