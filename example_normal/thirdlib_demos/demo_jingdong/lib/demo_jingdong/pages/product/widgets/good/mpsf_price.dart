import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

// 自定义价格显示
class MpsfPrice extends StatelessWidget {
  final String? value;
  final double? integerSize; //整数部分字体大小
  final double? decimalSize; //小数部分字体大小
  final Color? color;
  final bool? bold;
  const MpsfPrice({
    Key? key,
    this.value,
    this.integerSize = 20,
    this.decimalSize = 12,
    this.color = Colors.red,
    this.bold = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String price = value ?? "";
    List splitArr = price.split(".");
    if (splitArr.length == 2) {
      return RichText(
        maxLines: 1,
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: [
            TextSpan(
              text: "￥",
              style: TextStyle(
                fontSize: decimalSize,
                fontWeight: bold == true ? FontWeight.bold : null,
                color: color,
              ),
            ),
            TextSpan(
              text: HyzyTextTools.mpsfStr(splitArr.first),
              style: TextStyle(
                fontSize: integerSize,
                fontWeight: bold == true ? FontWeight.bold : null,
                color: color,
              ),
            ),
            TextSpan(
              text: ".",
              style: TextStyle(
                fontSize: decimalSize,
                fontWeight: bold == true ? FontWeight.bold : null,
                color: color,
              ),
            ),
            TextSpan(
              text: HyzyTextTools.mpsfStr(splitArr.last),
              style: TextStyle(
                fontSize: decimalSize,
                fontWeight: bold == true ? FontWeight.bold : null,
                color: color,
              ),
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
