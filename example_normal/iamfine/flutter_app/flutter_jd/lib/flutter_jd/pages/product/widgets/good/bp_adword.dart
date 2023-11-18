import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../vm/product_detail_viewmodel.dart';

class BpBpAdword extends StatelessWidget {
  const BpBpAdword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAdword");
    if (floor == null) {
      return Container();
    }
    Map ad = floor["data"]?["ad"] ?? {};
    String adword = ad["adword"] ?? "";
    String adLinkContent = ad["adLinkContent"] ?? "";
    String color = ad["color"] ?? "#000000";
    String textColor = ad["textColor"] ?? "#000000";
    if (adword.isEmpty) {
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: getColorFromHex("#EEEEEE"), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              overflow: TextOverflow.clip,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: adword,
                    style: TextStyle(
                        fontSize: 12, color: getColorFromHex(textColor)),
                  ),
                  TextSpan(
                    text: adLinkContent,
                    style:
                        TextStyle(fontSize: 12, color: getColorFromHex(color)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
