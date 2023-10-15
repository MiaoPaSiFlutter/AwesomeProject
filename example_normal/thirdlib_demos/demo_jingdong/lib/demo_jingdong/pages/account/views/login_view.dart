import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../config/jingdong_launch_id_config.dart';
import '../widgets/pwd_login_widget.dart';
import '../widgets/sms_login_widget.dart';

class LoginView extends CommonGetXWidget<LoginController> {
  LoginView({Key? key}) : super(key: key);
  @override
  String? createAppBarTitleStr() => JindDongLaunchIdConfig.general.tr;
  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.grey[350],
        ),
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Obx(() {
                return controller.index.value == 0
                    ? const SmsLoginView()
                    : const PwdLoginView();
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// 创建导航栏 右边按钮集合
  @override
  List<Widget>? createAppBaractions() {
    return [
      InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          child: Text("帮助", style: FontConfig().fontBold14Black),
        ),
      )
    ];
  }
}

class LoginController extends CommonGetXController {
  final count = 0.obs;

  final index = 0.obs;

  /// 配置默认选项
  @override
  configDefault() {}

  void increment() => count.value++;
}
