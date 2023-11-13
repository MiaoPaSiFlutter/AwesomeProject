import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../vm/product_detail_viewmodel.dart';

class BpBpBusSupport extends StatelessWidget {
  const BpBpBusSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpBusSupport");
    if (floor == null) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          _buildCommentInfoList(context),
        ],
      ),
    );
  }

  Widget _buildCommentInfoList(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpBusSupport");

    List bizList = floor?["data"]?["bizList"] ?? [];
    return SizedBox(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: bizList.length,
        itemBuilder: (context, index) {
          String icon = bizList[index]["icon"] ?? "";
          String title = bizList[index]["title"] ?? "";
          String desc = bizList[index]["desc"] ?? "";

          return SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //头部
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonExtendedImageWidget.netWorkImget(
                        url: icon, width: 20),
                    Text(title, style: const TextStyle(fontSize: 12)),
                  ],
                ),
                //评论
                Text(desc, style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
