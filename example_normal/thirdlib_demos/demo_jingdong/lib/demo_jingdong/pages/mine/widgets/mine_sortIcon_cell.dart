import 'package:flutter/material.dart';
import 'small_collection_item.dart';
import 'mid_info_headerview.dart';

class MineSortIconCell extends StatelessWidget {
  final Map? floor;
  const MineSortIconCell({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _buildHeaderInfoView(context),
          _buildGridView(context),
        ],
      ),
    );
  }

  //////////////////////////
  ////////////////////////// 标题
  //////////////////////////
  Widget _buildHeaderInfoView(BuildContext context) {
    return GestureDetector(
      child: const MidInfoHeaderView(labelName: "我的钱包"),
      onTap: () {},
    );
  }

  //////////////////////////
  ////////////////////////// GridView
  //////////////////////////
  Widget _buildGridView(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        List orderList = floor?["data"]?["nodes"] ?? [];
        double screenWidth = p1.maxWidth;
        double itemCardW = (screenWidth) / 5;
        double itemCardH = 40 + 40;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          itemCount: orderList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: itemCardW / itemCardH,
          ),
          itemBuilder: (context, index) {
            Map node = orderList[index];
            return _cellBuilder(context, node);
          },
        );
      },
    );
  }

  Widget _cellBuilder(BuildContext context, Map node) {
    return SmallCollectionItem(
      imageUrl: node["contentInfo"]?["safeImage"],
      title: node["title"]?["value"],
      subtitle: node["subtitle"]?["value"],
      redDotValue: 0,
    );
  }
}
