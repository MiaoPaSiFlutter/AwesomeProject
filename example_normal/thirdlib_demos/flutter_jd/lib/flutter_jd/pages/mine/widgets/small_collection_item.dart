import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/components/common_extendeed_image_widget.dart';

class SmallCollectionItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final int? redDotValue;
  const SmallCollectionItem({
    Key? key,
    this.imageUrl,
    this.title,
    this.subtitle,
    this.redDotValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 35,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.transparent),
                  ),
                  child: CommonExtendedImageWidget.netWorkImget(
                      url: imageUrl ?? ''),
                ),
                Visibility(
                  visible: ((redDotValue != null && redDotValue! > 0)
                      ? true
                      : false),
                  child: Positioned(
                    right: 0,
                    child: ClipPath(
                      clipper: TrianglePath(),
                      child: Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        color: Colors.red,
                        child: Text(
                          "${redDotValue ?? ""}",
                          maxLines: 1,
                          style:
                              const TextStyle(fontSize: 9, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    title ?? '',
                    maxLines: 1,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    subtitle ?? '',
                    maxLines: 1,
                    style: const TextStyle(fontSize: 8),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

///绘制不规则Widget
class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height);

    // 画一个矩形区域
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.height / 2,
    );
    // 在矩形区域画圆弧
    path.addArc(rect, 90 * (pi / 180), -360 * (pi / 180));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
