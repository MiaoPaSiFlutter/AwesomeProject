import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpUpNaviBar extends StatelessWidget {
  const BpBpUpNaviBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ProductDetailViewModel>();
    final Map? floor = model.getFloorInfo("bpUpNaviBar");
    List naviBar = floor?["data"]?["naviBar"] ?? [];
    if (floor == null || naviBar.isEmpty) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: getColorFromHex("#EEEEEE"), width: 0.5),
        ),
      ),
      child: _buildGridView(context, naviBar),
    );
  }

  //////////////////////////
  ////////////////////////// GridView
  //////////////////////////
  Widget _buildGridView(BuildContext context, List naviBar) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double itemCardW = (screenWidth) / 3;
        double itemCardH = 40;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          itemCount: naviBar.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: itemCardW / itemCardH,
          ),
          itemBuilder: (context, index) {
            Map node = naviBar[index];
            return _cellBuilder(context, node);
          },
        );
      },
    );
  }

  Widget _cellBuilder(BuildContext context, Map node) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonExtendedImageWidget.netWorkImget(url: node["icon"], height: 20),
        Text(node["name"], style: const TextStyle(fontSize: 12))
      ],
    );
  }
}
