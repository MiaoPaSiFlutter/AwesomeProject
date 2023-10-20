import 'package:flutter/material.dart';
import 'small_collection_item.dart';
import 'mid_info_headerview.dart';

class MineHomeChannelCell extends StatelessWidget {
  final Map? floor;
  const MineHomeChannelCell({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
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
      child: const MidInfoHeaderView(labelName: "更多入口"),
      onTap: () {},
    );
  }

  //////////////////////////
  ////////////////////////// GridView
  //////////////////////////
  Widget _buildGridView(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        List nodes = floor?["data"]?["nodes"] ?? [];
        List orderList = nodes.isNotEmpty ? nodes.first : [];
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
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(node["title"]?["value"]),
        ));
      },
      child: SmallCollectionItem(
        imageUrl: node["safeImage"],
        title: node["title"]?["value"],
        subtitle: node["subtitle"]?["value"],
        redDotValue: 0,
      ),
    );
  }
}
