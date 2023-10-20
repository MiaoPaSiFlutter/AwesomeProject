// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 首页-滑动通栏
class HomeHybrid_1111 extends StatefulWidget {
  final Map? floor;
  final int? subFloorNum;
  final List? subFloors;
  const HomeHybrid_1111({
    Key? key,
    this.floor,
    this.subFloorNum,
    this.subFloors,
  }) : super(key: key);

  @override
  State createState() => _HomeHybrid_1111State();
}

class _HomeHybrid_1111State extends State<HomeHybrid_1111> {
  String? _showName;
  String? _rightCorner;
  String? _rightCornerImg;

  List _datas = [];
  @override
  void initState() {
    _showName = widget.floor?["showName"] ?? "";
    _rightCorner = widget.floor?["rightCorner"] ?? "";
    _rightCornerImg = widget.floor?["rightCornerImg"] ?? "";

    if (widget.subFloors != null && widget.subFloors!.isNotEmpty) {
      Map first = widget.subFloors!.first;
      List data = first["data"];
      if (data.isNotEmpty) {
        List groupInfoList = data.first["groupInfoList"];
        if (groupInfoList.isNotEmpty) {
          Map flexData = groupInfoList.first["flexData"];
          if (flexData.containsKey("0")) {
            _datas.add(flexData["0"].first);
          }
          if (flexData.containsKey("1")) {
            _datas.add(flexData["1"].first);
          }
          if (flexData.containsKey("2")) {
            _datas.add(flexData["2"].first);
          }
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
        color: Colors.white,
        borderRadius: HzyNormalTools.buildFeedCellRadius(1, 0),
      ),
      child: Column(
        children: <Widget>[
          _buildListView(context),
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        return Row(
          children: _buildTopView(context, screenWidth),
        );
      },
    );
  }

  List<Widget> _buildTopView(BuildContext context, double screenWidth) {
    /*
    266-290
    553-290
    266-290
    */
    double totalW = 266 + 553 + 266;
    double leftItemW = (266 / totalW) * screenWidth;
    double leftItemH = leftItemW / (266 / 290);
    double centItemW = (553.0 / totalW) * screenWidth;
    double centItemH = centItemW / (553.0 / 290);

    List<Widget> children = [];
    for (var i = 0; i < _datas.length; i++) {
      var item = _datas[i];
      String img = item?["flexData"]?["img"] ?? "";
      String showName = item?["flexData"]?["showName"] ?? "";
      String channelLogo = item?["flexData"]?["channelLogo"] ?? "";
      String moduleBgImg = item?["flexData"]?["moduleBgImg"] ?? "";

      Widget itemWidget;

      if (i == 0 || i == 2) {
        itemWidget = GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(showName),
            ));
          },
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: leftItemW,
                height: leftItemH,
                child: CommonExtendedImageWidget.netWorkImget(
                    url: moduleBgImg, fit: BoxFit.fill),
              ),
              Positioned(
                top: 70 / 345 * leftItemH,
                left: (i == 0 ? 45 : 30) / 270 * leftItemW,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: 196.0 / 270 * leftItemW,
                    height: 195.0 / 345 * leftItemH,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                    ),
                    child: CommonExtendedImageWidget.netWorkImget(url: img),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        String img2 = item?["flexData"]?["img2"] ?? "";
        itemWidget = Expanded(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(showName),
              ));
            },
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: centItemW,
                  height: centItemH,
                  child: CommonExtendedImageWidget.netWorkImget(
                      url: moduleBgImg, fit: BoxFit.fill),
                ),
                Positioned(
                  top: 57 / 290 * centItemH,
                  left: 20 / 553 * centItemW,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: 200.0 / 553 * centItemW,
                      height: 200.0 / 290 * centItemH,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                      ),
                      child: CommonExtendedImageWidget.netWorkImget(url: img),
                    ),
                  ),
                ),
                Positioned(
                  top: 57 / 290 * centItemH,
                  right: 54 / 553 * centItemW,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: 200.0 / 553 * centItemW,
                      height: 200.0 / 290 * centItemH,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue),
                      ),
                      child: CommonExtendedImageWidget.netWorkImget(url: img2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      children.add(itemWidget);
    }
    return children;
  }
}
