import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpActivity extends StatelessWidget {
  const BpBpActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpActivity");
    if (floor == null) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            child: const Text("活动", style: TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Column(
              children: [
                _buildBigSale(context),
                _buildBizActs(context),
              ],
            ),
          ),
          const Row(
            children: [
              Column(
                children: [
                  Text("...",
                      style: TextStyle(fontSize: 10, color: Colors.grey))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///高价回收
  Widget _buildBigSale(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpActivity");

    Map bigSale = floor?["data"]?["actions"]?["bigSale"] ?? {};
    String icon = bigSale["icon"] ?? "";
    String desc = bigSale["desc"] ?? "";
    return Row(
      children: [
        CommonExtendedImageWidget.netWorkImget(url: icon, height: 10),
        Expanded(
          child: Text(
            desc,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget _buildBizActs(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpActivity");

    List bizActs = floor?["data"]?["actions"]?["bizActs"] ?? [];
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 5),
      child: Wrap(
        children: bizActs.map((e) {
          Map coupon = e;
          String icon = coupon["icon"];
          return Container(
            margin: const EdgeInsets.only(right: 5, bottom: 5),
            child:
                CommonExtendedImageWidget.netWorkImget(url: icon, height: 12),
          );
        }).toList(),
      ),
    );
  }
}
