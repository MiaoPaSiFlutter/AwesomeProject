// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpBangDan extends StatelessWidget {
  const BpBpBangDan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpBangDan");
    if (floor == null) {
      return Container();
    }
    String rankName = floor["data"]?["leaderBoard"]?["rankName"] ?? "";
    String logoIcon = floor["data"]?["leaderBoard"]?["logoIcon"] ?? "";
    String floorBgImage = floor["data"]?["leaderBoard"]?["floorBgImage"] ?? "";
    String arrowPic = floor["data"]?["leaderBoard"]?["arrowPic"] ?? "";

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: getColorFromHex("#EEEEEE"), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          CommonExtendedImageWidget.netWorkImget(url: logoIcon, height: 24),
          Expanded(
            child: RichText(
              overflow: TextOverflow.clip,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: rankName,
                    style: TextStyle(
                        fontSize: 12, color: getColorFromHex("#000000")),
                  ),
                ],
              ),
            ),
          ),
          CommonExtendedImageWidget.netWorkImget(url: arrowPic, height: 12),
        ],
      ),
    );
  }
}
