import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpUnionRank extends StatelessWidget {
  const BpBpUnionRank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpUnionRank");
    if (floor == null) {
      return Container();
    }

    String floorBgImage = floor["data"]?["unitedRank"]?["floorBgImage"] ?? "";
    String icon = floor["data"]?["unitedRank"]?["icon"] ?? "";
    String desc = floor["data"]?["unitedRank"]?["desc"] ?? "";
    String arrowPic = floor["data"]?["unitedRank"]?["arrowPic"] ?? "";

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
        image: DecorationImage(
          image:
              ExtendedNetworkImageProvider(HyzyTextTools.mpsfStr(floorBgImage)),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          CommonExtendedImageWidget.netWorkImget(url: icon, height: 24),
          Expanded(child: Text(desc, style: const TextStyle(fontSize: 12))),
          CommonExtendedImageWidget.netWorkImget(url: arrowPic, height: 10),
        ],
      ),
    );
  }
}
