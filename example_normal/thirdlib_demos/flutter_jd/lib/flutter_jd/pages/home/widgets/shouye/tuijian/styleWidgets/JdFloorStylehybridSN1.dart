// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 首页-滑动通栏
class HomeHybrid_1 extends StatefulWidget {
  final Map? floor;
  final int? subFloorNum;
  final List? subFloors;
  const HomeHybrid_1({
    Key? key,
    this.floor,
    this.subFloorNum,
    this.subFloors,
  }) : super(key: key);

  @override
  State createState() => _HomeHybrid_1State();
}

class _HomeHybrid_1State extends State<HomeHybrid_1> {
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
      _datas = first["data"];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(width: 1, color: Colors.green),
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
    double totalW = 270 + 585 + 270.0;
    double leftItemW = (270 / totalW) * screenWidth;
    double leftItemH = leftItemW / (270.0 / 345);
    double centItemW = (585.0 / totalW) * screenWidth;
    double centItemH = centItemW / (585.0 / 345);

    List<Widget> children = [];
    for (var i = 0; i < _datas.length; i++) {
      var item = _datas[i];
      String img = item["img"] ?? "";
      String showName = item["showName"] ?? "";
      String channelLogo = item["channelLogo"] ?? "";
      String moduleBgImg = item["moduleBgImg"] ?? "";

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
              Container(
                width: leftItemW,
                height: leftItemH,
                decoration: const BoxDecoration(
                    // border: Border.all(width: 1, color: Colors.green),
                    ),
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
                    decoration: const BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.blue),
                        ),
                    child: CommonExtendedImageWidget.netWorkImget(url: img),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        String img2 = item["img2"] ?? "";
        itemWidget = Expanded(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(showName),
              ));
            },
            child: Stack(
              children: <Widget>[
                Container(
                  width: centItemW,
                  height: centItemH,
                  decoration: const BoxDecoration(
                      // border: Border.all(width: 1, color: Colors.green),
                      ),
                  child: CommonExtendedImageWidget.netWorkImget(
                      url: moduleBgImg, fit: BoxFit.fill),
                ),
                Positioned(
                  top: 57 / 345 * centItemH,
                  left: 54 / 585 * centItemW,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: 200.0 / 585 * centItemW,
                      height: 200.0 / 345 * centItemH,
                      decoration: const BoxDecoration(
                          // border: Border.all(width: 1, color: Colors.blue),
                          ),
                      child: CommonExtendedImageWidget.netWorkImget(url: img),
                    ),
                  ),
                ),
                Positioned(
                  top: 57 / 345 * centItemH,
                  right: 54 / 585 * centItemW,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: 200.0 / 585 * centItemW,
                      height: 200.0 / 345 * centItemH,
                      decoration: const BoxDecoration(
                          // border: Border.all(width: 1, color: Colors.blue),
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
