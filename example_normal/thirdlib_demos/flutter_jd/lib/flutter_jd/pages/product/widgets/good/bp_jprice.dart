// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../vm/product_detail_viewmodel.dart';
import 'mpsf_price.dart';

class BpBpJPrice extends StatelessWidget {
  const BpBpJPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpJPrice");
    if (floor == null) {
      return Container();
    }
    String jiangJia = floor["data"]?["priceIcon"]?["jiangJia"] ?? "";
    String kanJia = floor["data"]?["kanJia"]?["kanJia"] ?? "";
    String jprice = floor["data"]?["priceInfo"]?["jprice"]?["value"] ?? "";

    Text Btn1 =
        const Text("降价通知", style: TextStyle(fontSize: 10, color: Colors.grey));
    Text Btn2 =
        const Text("0.9万", style: TextStyle(fontSize: 10, color: Colors.grey));
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(child: MpsfPrice(value: jprice)),
          Row(children: [
            Column(children: [
              CommonExtendedImageWidget.netWorkImget(url: jiangJia, width: 20),
              Btn1
            ]),
            const SizedBox(width: 10),
            Column(children: [
              CommonExtendedImageWidget.netWorkImget(url: jiangJia, width: 20),
              Btn2
            ])
          ])
        ],
      ),
    );
  }
}
