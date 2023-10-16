import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../views/login_view.dart';

/// Sms登录
class PwdLoginView extends StatefulWidget {
  const PwdLoginView({Key? key}) : super(key: key);

  @override
  State createState() => _PwdLoginViewState();
}

class _PwdLoginViewState extends State<PwdLoginView> {
  LoginController get controller => Get.put(LoginController());

  //定义一个controller
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final FocusNode _accountFocus = FocusNode();
  final FocusNode _pwdFocus = FocusNode();
  bool _loginBtnEnable = false; //登录按钮是否可点击
  bool _isAgree = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _accountController.addListener(_verify);
    _pwdController.addListener(_verify);
    _accountController.text = SharedPreferencesTool.getString("phone") ?? "";
  }

  @override
  void dispose() {
    _accountController.removeListener(() {});
    _accountController.dispose();
    _pwdController.removeListener(() {});
    _pwdController.dispose();
    super.dispose();
  }

  void _verify() {
    String name = _accountController.text;
    String password = _pwdController.text;
    bool loginBtnEnable = true;
    if (name.isEmpty) {
      loginBtnEnable = false;
    }
    if (password.isEmpty) {
      loginBtnEnable = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (loginBtnEnable != _loginBtnEnable) {
      setState(() {
        _loginBtnEnable = loginBtnEnable;
      });
    }
  }

  void _login() {
    dPrint("msg");
    SharedPreferencesTool.putString("accessToken", "123456");
    SharedPreferencesTool.putString("refreshToken", "qweasdzxc");
    // NavigatorUtil.push(context, Routes.mainFrame, clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildLOGOView(),
        _buildAreaView(),
        _buildPhoneView(),
        _buildPrivateView(),
        _buildButtonsView(),
        _buildOtherLoginTypeView(),
      ],
    );
  }

  Widget _buildLOGOView() {
    return Container(
      alignment: Alignment.center,
      child: CommonExtendedImageWidget.configImage(
        width: 100,
        height: 100,
      ),
    );
  }

  Widget _buildAreaView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 40,
          color: const Color(0xFFEEEEEE),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: CommonTextFieldWidget(
                    key: const Key('account'),
                    focusNode: _accountFocus,
                    controller: _accountController,
                    keyboardType: TextInputType.phone,
                    hintText: "用户名/邮箱/手机号",
                    obscureText: false,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 40,
          color: const Color(0xFFEEEEEE),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: CommonTextFieldWidget(
                    key: const Key('pwd'),
                    focusNode: _pwdFocus,
                    controller: _pwdController,
                    keyboardType: TextInputType.text,
                    hintText: "请输入密码",
                    obscureText: true,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivateView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black),
          children: [
            WidgetSpan(
              child: InkWell(
                child: Image.asset(
                  NormalModuleUtils.configPackagesImage(
                      packagename: 'demo_jingdong',
                      name: _isAgree
                          ? "assets/images/jingdong_demos/login/checked.png"
                          : "assets/images/jingdong_demos/login/unchecked.png"),
                  height: 12,
                ),
                onTap: () {
                  setState(() {
                    _isAgree = !_isAgree;
                  });
                },
              ),
            ),
            const TextSpan(
              text: "登录即代表您已同意",
            ),
            const TextSpan(
              text: "《隐私政策》",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: _loginBtnEnable ? _login : null,
              child: Container(
                width: double.infinity,
                height: 40,
                color: _loginBtnEnable ? Colors.red : Colors.red.shade50,
                child: const Center(
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      child: const Text(
                        "新用户注册",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GetBuilder<LoginController>(
                    builder: (controller) {
                      return InkWell(
                        onTap: () {
                          controller.index.value = 0;
                          // context.read<LoginVM>().refreshIndex(0);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "短信验证码登录",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // NavigatorUtil.push(
                      //     context, LoginRouter.resetPasswordPage);
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "忘记密码",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOtherLoginTypeView() {
    List icons = [
      NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong',
          name: "assets/images/jingdong_demos/login/WJLogin_QQ.png"),
      NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong',
          name: "assets/images/jingdong_demos/login/WJLogin_QQ.png"),
      NormalModuleUtils.configPackagesImage(
          packagename: 'demo_jingdong',
          name: "assets/images/jingdong_demos/login/WJLogin_Wechat.png"),
    ];

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text("其他登录方式",
              style: TextStyle(color: Colors.black, fontSize: 12)),
        ),
        Container(
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.red, width: 4),
          // ),
          height: 100,
          child: Row(
            children: icons.map((e) {
              return Expanded(
                child: InkWell(
                  onTap: () {
                    int index = icons.indexOf(e);
                    if (index == 0) {
                      //
                    } else if (index == 1) {
                      //
                    } else if (index == 2) {
                      //
                    }
                  },
                  child: Center(
                    child: Image.asset(e, height: 40),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
