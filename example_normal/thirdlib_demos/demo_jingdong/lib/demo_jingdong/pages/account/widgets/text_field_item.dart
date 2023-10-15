import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 封装输入框
class TextFieldItem extends StatelessWidget {
  const TextFieldItem({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.hintText = "",
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.only(left: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
        bottom: Divider.createBorderSide(context, width: 0.6),
      )),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(title),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              focusNode: focusNode,
              keyboardType: keyboardType,
              inputFormatters: _getInputFormatters(),
              controller: controller,
              //style: TextStyles.textDark14,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none, //去掉下划线
                //hintStyle: TextStyles.textGrayC14
              ),
            ),
          ),
          const SizedBox(width: 16)
        ],
      ),
    );
  }

  _getInputFormatters() {
    if (keyboardType == const TextInputType.numberWithOptions(decimal: true)) {
      return [InputUsNumberTextInputFormatter()];
    }
    if (keyboardType == TextInputType.number ||
        keyboardType == TextInputType.phone) {
      return [
        // FilteringTextInputFormatter.allow(RegExp("[a-z]")),
        FilteringTextInputFormatter.allow(RegExp('[0-9]')), //仅接受/允许数字
        // FilteringTextInputFormatter.digitsOnly,//等效于 .allow（RegExp（'[0-9]'））
        // LengthLimitingTextInputFormatter(6), //长度限制(限制6位)
        // FilteringTextInputFormatter.singleLineFormatter, //限制单行
      ];
    }
    return null;
  }
}
