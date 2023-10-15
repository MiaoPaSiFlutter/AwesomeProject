import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class CommonTagsWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List? tags;
  final List<Widget>? children;
  final double? spacing;
  final double? runSpacing;
  final Decoration? decoration;
  final TextStyle? style;
  final void Function(int index)? onTap;
  const CommonTagsWidget({
    Key? key,
    this.margin,
    this.padding,
    this.tags,
    this.children,
    this.spacing,
    this.runSpacing,
    this.decoration,
    this.style,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List labelList = tags ?? [];

    if (labelList.isEmpty && (children == null || children!.isEmpty)) {
      return Container();
    } else {
      Decoration decoration_ = BoxDecoration(
        border: Border.all(color: HzyCommonColor().col000000, width: 1),
        borderRadius: BorderRadius.circular(2),
      );
      TextStyle style_ =
          TextStyle(fontSize: 10, color: HzyCommonColor().col000000);

      return Container(
        margin: margin,
        padding: padding,
        alignment: Alignment.topLeft,
        child: Wrap(
          spacing: spacing ?? 8, // 主轴(水平)方向间距
          runSpacing: runSpacing ?? 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start, //沿主轴方向居中
          children: children ??
              labelList.map((e) {
                return InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(left: 2, right: 2),
                    decoration: decoration ?? decoration_,
                    child: Text(e, style: style ?? style_),
                  ),
                  onTap: () {
                    if (onTap != null) {
                      onTap!(labelList.indexOf(e));
                    }
                  },
                );
              }).toList(),
        ),
      );
    }
  }
}
