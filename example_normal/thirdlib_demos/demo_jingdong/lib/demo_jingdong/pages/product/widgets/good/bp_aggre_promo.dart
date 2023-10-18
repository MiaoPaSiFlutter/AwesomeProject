import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpAggrePromo extends StatelessWidget {
  const BpBpAggrePromo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAggrePromo");
    if (floor == null) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            child: const Text("优惠", style: TextStyle(fontSize: 12)),
          ),
          Expanded(
            child: Column(
              children: [
                _buildWhiteBarInfo(context),
                _buildCoupon(context),
                _buildGift(context),
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

  ///白条
  Widget _buildWhiteBarInfo(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAggrePromo");

    String text = "白条";
    Map whiteBarInfo =
        floor?["data"]?["preferentialGuide"]?["whiteBarInfo"] ?? {};
    String marketingTitle = whiteBarInfo["marketingTitle"] ?? "";
    return Row(
      children: [
        _createIconText(text),
        Flexible(
          child: Text(
            marketingTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  ///领券
  Widget _buildCoupon(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAggrePromo");

    String text = "领券";
    List couponInfo = floor?["data"]?["preferentialGuide"]?["couponInfo"] ?? [];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createIconText(text),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: couponInfo.length,
              itemBuilder: (content, index) {
                Map coupon = couponInfo[index];
                String labelTxt = coupon["labelTxt"];
                return Text(labelTxt,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12));
              },
            ),
          )
        ],
      ),
    );
  }

  ///赠品
  Widget _buildGift(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpAggrePromo");

    String text = "赠品";
    List gifts =
        floor?["data"]?["preferentialGuide"]?["promotion"]?["gift"] ?? [];
    if (gifts.isEmpty) {
      return Container();
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createIconText(text),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gifts.length > 1 ? 2 : 1,
              itemBuilder: (content, index) {
                Map gift = gifts[index];
                String value = gift["value"];
                return Text(value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _createIconText(String text) {
    return Container(
      padding: const EdgeInsets.all(2),
      color: Colors.red.shade100,
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, color: Colors.red),
      ),
    );
  }
}
