import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpParts extends StatelessWidget {
  const BpBpParts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpParts");
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
          _buildHeader(context),
          _buildCommentInfoList(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Row(
      children: [
        Wrap(
          children: [Text("热门配件", style: TextStyle(fontSize: 13))],
        ),
      ],
    );
  }

  Widget _buildCommentInfoList(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpParts");

    List imgInfo = floor?["data"]?["imgInfo"] ?? [];
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: imgInfo.length,
        itemBuilder: (context, index) {
          String imgUrl = imgInfo[index]["imgUrl"] ?? "";
          return CommonExtendedImageWidget.netWorkImget(
              url: imgUrl, width: 100);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
