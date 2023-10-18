// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JdFloorStyle0910 extends StatelessWidget {
  final Map? floor;
  const JdFloorStyle0910({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        String style = floor?["style"] ?? "";
        String floorName = floor?["floorName"] ?? "";
        String rightImg = floor?["rightImg"] ?? "";
        String rightText = floor?["rightText"] ?? "";
        List content = floor?["content"];
        double itemCardW = (screenWidth - 10 - 10 * 2) / 3;
        double itemCardH = 30 + itemCardW + 40;
        double childAspectRatio = itemCardW / itemCardH;
        return Container(
          height: itemCardH,
          color: Colors.black12,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            itemCount: content.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: 3,
                //纵轴间距
                mainAxisSpacing: 10.0,
                //横轴间距
                crossAxisSpacing: 10.0,
                //子组件宽高长度比例
                childAspectRatio: childAspectRatio),
            itemBuilder: (context, index) {
              return _createGridViewItem(context, index, itemCardW, itemCardH);
            },
          ),
        );
      },
    );
  }

  Widget _createGridViewItem(
    BuildContext context,
    int position,
    double itemCardW,
    double itemCardH,
  ) {
    List content = floor?["content"];
    String img = content[position]["img"] ?? "";
    String name = content[position]["name"] ?? "";
    String bgImg = content[position]["bgImg"] ?? "";
    String saleNumText = content[position]["saleNumText"] ?? "";
    String rankName = content[position]["rankName"] ?? "";

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(img),
        ));
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          width: itemCardW,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Container(
                  height: 30,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(name,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)))),

              Expanded(
                  child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 0.9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CommonExtendedImageWidget.netWorkImget(url: img),
                ),
              )),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.green),
                ),
                child: Stack(
                  children: [
                    CommonExtendedImageWidget.netWorkImget(
                        url: bgImg, width: itemCardW),
                    Center(
                        child: Text(rankName,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white)))
                  ],
                ),
              ),
              // CommonNetworkImage(bgImg, width: itemCardW, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
