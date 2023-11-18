import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

///输入框封装
class CommonTextFieldWidget extends StatefulWidget {
  /// 用于集成测试寻找widget
  final String? keyName;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool autoFocus;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool obscureText;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const CommonTextFieldWidget({
    Key? key,
    this.keyName,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.maxLength,
    this.autoFocus = false,
    this.keyboardType,
    this.hintText,
    this.obscureText = false,
    this.style,
    this.hintStyle,
  }) : super(key: key);

  @override
  State createState() => _CommonTextFieldWidgetState();
}

class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {
  bool _isShowPwd = false;
  bool _isShowDeleteBtn = false;
  bool _isShowEyeBtn = false;
  @override
  void initState() {
    super.initState();

    /// 获取初始化值
    _isShowDeleteBtn = _checkShowDelete();
    _isShowEyeBtn = widget.obscureText;

    /// 监听输入改变
    widget.controller?.addListener(() {
      setState(() {
        _isShowDeleteBtn = _checkShowDelete();
      });
    });
  }

  bool _checkShowDelete() {
    if (!HyzyTextTools.isEmpty(widget.controller?.text)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
    List<TextInputFormatter> inputFormatters = [];
    if (widget.keyboardType == TextInputType.number ||
        widget.keyboardType == TextInputType.phone) {
      inputFormatters = [FilteringTextInputFormatter.allow(RegExp("[0-9]"))];
    } else {
      inputFormatters = [];
    }

    return Stack(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            TextField(
              textAlignVertical: TextAlignVertical.center,
              focusNode: widget.focusNode,
              maxLength: widget.maxLength,
              obscureText: widget.obscureText ? !_isShowPwd : false,
              autofocus: widget.autoFocus,
              controller: widget.controller,
              textInputAction: TextInputAction.done,
              keyboardType: widget.keyboardType,
              style: widget.style,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintStyle,
                //内容垂直居中
                counterText: "",
                contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildDeleteBtn(),
                _buildEyeBtn(),
              ],
            )
          ],
        ),
        widget.enabled
            ? Container()
            : Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
      ],
    );
  }

  Widget _buildDeleteBtn() {
    if (_isShowDeleteBtn) {
      return Container(
        margin: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          child: Image.asset(
            NormalModuleUtils.normalModuleImagePath(
                name: 'assets/qyg_shop_icon_delete.png'),
            width: 18.0,
            height: 18.0,
          ),
          onTap: () {
            widget.controller?.text = "";
          },
        ),
      );
    }
    return Container();
  }

  Widget _buildEyeBtn() {
    if (_isShowEyeBtn) {
      return Container(
        margin: const EdgeInsets.only(right: 10),
        child: GestureDetector(
          child: Image.asset(
            NormalModuleUtils.normalModuleImagePath(
                name: _isShowPwd
                    ? 'assets/qyg_shop_icon_hide.png'
                    : 'assets/qyg_shop_icon_display.png'),
            width: 18.0,
            height: 18.0,
          ),
          onTap: () {
            setState(() {
              _isShowPwd = !_isShowPwd;
            });
          },
        ),
      );
    }
    return Container();
  }
}
