import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpServe extends StatelessWidget {
  const BpBpServe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpServe");
    if (floor == null) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: getColorFromHex("#EEEEEE"),
        border: Border(
          top: BorderSide(color: getColorFromHex("#EEEEEE"), width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                _buildBizActs(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///高价回收
  Widget _buildBigSale(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpServe");

    Map bigSale = floor?["data"]?["actions"]?["bigSale"] ?? {};
    String icon = bigSale["icon"] ?? "";
    String desc = bigSale["desc"] ?? "";
    dPrint("message $bigSale");
    return Row(
      children: [
        CommonExtendedImageWidget.netWorkImget(url: icon, height: 12),
        Expanded(child: Text(desc, style: const TextStyle(fontSize: 12)))
      ],
    );
  }

  Widget _buildBizActs(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpServe");

    List iconList = floor?["data"]?["serviceInfo"]?["basic"]?["iconList"] ?? [];
    return Container(
      alignment: Alignment.topLeft,
      child: Wrap(
        children: iconList.map((e) {
          Map coupon = e;
          String text = coupon["text"];
          return Container(
            margin: const EdgeInsets.only(right: 5, bottom: 5),
            child: Text(text, style: const TextStyle(fontSize: 10)),
          );
        }).toList(),
      ),
    );
  }
}
