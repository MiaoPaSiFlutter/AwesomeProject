import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

Widget createActivityIndicator({
  String text = "加载中...",
  Color? bgColor,
}) {
  return Expanded(
    child: Container(
      color: bgColor ?? Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CupertinoActivityIndicator(),
            Text(text, style: FontConfig().fontMedium12Black)
          ],
        ),
      ),
    ),
  );
}

Widget createCellItemWidget({
  String? text,
  String? subtitle,
  Widget? subtitleWg,
  void Function()? onTap,
  bool useSliver = true,
}) {
  Widget child = InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        bottom: 10.w,
        top: 10.w,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(text ?? '', style: FontConfig().fontMedium14Black)),
          subtitleWg ??
              (Text(subtitle ?? '', style: FontConfig().fontMedium12Black)),
          const SizedBox(
            width: 15,
            height: 15,
            child: IconButton(
              padding: EdgeInsets.all(0),
              iconSize: 15,
              icon: Icon(
                Icons.arrow_right_alt,
                color: Colors.black,
              ),
              onPressed: null,
            ),
          )
        ],
      ),
    ),
  );

  if (useSliver) {
    return SliverToBoxAdapter(
      child: child,
    );
  } else {
    return child;
  }
}
