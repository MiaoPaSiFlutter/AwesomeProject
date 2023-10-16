import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 登录模块的输入框封装
class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.maxLength = 16,
    this.autoFocus = false,
    this.keyboardType = TextInputType.text,
    this.hintText = "",
    this.isInputPwd = false,
    this.getVCode,
    this.keyName,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final int? maxLength;
  final bool autoFocus;
  final TextInputType keyboardType;
  final String hintText;
  final bool isInputPwd;
  final Future<bool> Function()? getVCode;

  /// 用于集成测试寻找widget
  final String? keyName;

  @override
  State createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isShowPwd = false;
  bool _isShowDelete = false;
  bool _isClick = true;

  /// 倒计时秒数
  final int second = 30;

  /// 当前秒数
  late int s;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    /// 获取初始化值
    _isShowDelete = widget.controller.text.isEmpty;

    /// 监听输入改变
    widget.controller.addListener(() {
      setState(() {
        _isShowDelete = widget.controller.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    widget.controller.removeListener(() {});
    widget.controller.dispose();
    super.dispose();
  }

  Future _getVCode() async {
    if (widget.getVCode != null) {
      bool isSuccess = await widget.getVCode!();
      if (isSuccess) {
        setState(() {
          s = second;
          _isClick = false;
        });
        _subscription = Stream.periodic(const Duration(seconds: 1), (i) => i)
            .take(second)
            .listen((i) {
          setState(() {
            s = second - i - 1;
            _isClick = s < 1;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
    List<TextInputFormatter> inputFormatters =
        (widget.keyboardType == TextInputType.number ||
                widget.keyboardType == TextInputType.phone)
            ? [FilteringTextInputFormatter.allow(RegExp("[0-9]"))]
            : [FilteringTextInputFormatter.allow(RegExp("[\u4e00-\u9fa5]"))];

    return Stack(
      // 子控件居中从右到左显示。
      alignment: Alignment.centerRight,
      children: <Widget>[
        TextField(
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          obscureText: widget.isInputPwd ? !_isShowPwd : false,
          autofocus: widget.autoFocus,
          controller: widget.controller,
          textInputAction: TextInputAction.done,
          keyboardType: widget.keyboardType,
          inputFormatters: inputFormatters,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _isShowDelete
                ? const SizedBox()
                : GestureDetector(
                    child: Image.asset(
                      key: Key('${widget.keyName}_delete'),
                      NormalModuleUtils.normalModuleImagePath(
                          name: 'assets/images/login/qyg_shop_icon_delete.png'),
                      width: 18.0,
                      height: 18.0,
                    ),
                    onTap: () => widget.controller.text = "",
                  ),
            !widget.isInputPwd ? const SizedBox() : const SizedBox(width: 16),
            !widget.isInputPwd
                ? const SizedBox()
                : GestureDetector(
                    child: Image.asset(
                      key: Key('${widget.keyName}_showPwd'),
                      NormalModuleUtils.normalModuleImagePath(
                          name: _isShowPwd
                              ? 'assets/images/login/qyg_shop_icon_hide.png'
                              : 'assets/images/login/qyg_shop_icon_display.png'),
                      width: 18.0,
                      height: 18.0,
                    ),
                    onTap: () {
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  ),
            widget.getVCode == null
                ? const SizedBox()
                : const SizedBox(width: 16),
            widget.getVCode == null
                ? const SizedBox()
                : Theme(
                    data: Theme.of(context).copyWith(
                      buttonTheme: const ButtonThemeData(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        height: 26.0,
                        minWidth: 76.0,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    child: TextButton(
                      onPressed: _isClick ? _getVCode : null,
                      style: const ButtonStyle(),
                      // textColor: themeData.primaryColor,
                      // color: Colors.transparent,
                      // disabledTextColor:
                      //     isDark ? JdColours.dark_text : Colors.white,
                      // disabledColor:
                      //     isDark ? JdColours.dark_text_gray : JdColours.text_gray_c,
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(1.0),
                      //     side: BorderSide(
                      //       color: _isClick
                      //           ? themeData.primaryColor
                      //           : Colors.transparent,
                      //       width: 0.8,
                      //     )),
                      child: Text(
                        _isClick ? "获取验证码" : "（$s s）",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
          ],
        )
      ],
    );
  }
}
