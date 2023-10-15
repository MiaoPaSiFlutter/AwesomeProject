import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class CommonIconLableWidget extends StatelessWidget {
  final String? text;
  final int? maxLines;
  final TextOverflow? overflow;
  final Widget? iconWidget;
  final TextStyle? style;
  const CommonIconLableWidget({
    Key? key,
    this.text,
    this.maxLines,
    this.overflow,
    this.iconWidget,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (HyzyTextTools.isEmpty(text)) {
      return Container();
    }
    List<InlineSpan> children = [];

    if (iconWidget != null) {
      WidgetSpan iconSpan = WidgetSpan(
          alignment: PlaceholderAlignment.middle, child: iconWidget!);
      children.add(iconSpan);
    }

    TextSpan textSpan = TextSpan(text: HyzyTextTools.mpsfStr(text));
    children.add(textSpan);

    return RichText(
      maxLines: maxLines ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      text: TextSpan(
        style:
            style ?? TextStyle(color: HzyCommonColor().col000000, fontSize: 13),
        children: children,
      ),
    );
  }
}
