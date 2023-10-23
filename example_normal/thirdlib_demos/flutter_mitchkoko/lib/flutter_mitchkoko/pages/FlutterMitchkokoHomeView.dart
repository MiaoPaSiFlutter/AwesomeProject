import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'DonutAppUI/DonutAppUI.dart';
import 'EmailLoginLogoutUI/EmailLoginLogoutUI.dart';
import 'ModernSmartHomeUI/ModernSmartHomeUIApp.dart';

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
