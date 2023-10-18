import 'package:flutter/material.dart';

///卡片
class JdCommonCard extends StatelessWidget {
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final Widget? child;
  const JdCommonCard({
    Key? key,
    this.child,
    this.color,
    this.elevation = 10.0,
    this.shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    this.margin = const EdgeInsets.all(0),
    this.clipBehavior = Clip.antiAlias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation, //设置阴影
      margin: margin,
      clipBehavior: clipBehavior, // 抗锯齿
      shape: shape, //设置圆角
      child: child,
    );
  }
}
