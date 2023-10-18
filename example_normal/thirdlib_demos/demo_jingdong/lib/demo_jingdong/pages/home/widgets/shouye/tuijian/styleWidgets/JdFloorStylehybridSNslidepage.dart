// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 首页-滑动通栏
class HomeHybrid_SlidePage extends StatefulWidget {
  final Map? floor;
  final int? subFloorNum;
  final List? subFloors;
  const HomeHybrid_SlidePage({
    Key? key,
    this.floor,
    this.subFloorNum,
    this.subFloors,
  }) : super(key: key);

  @override
  State createState() => _HomeHybrid_SlidePageState();
}

class _HomeHybrid_SlidePageState extends State<HomeHybrid_SlidePage> {
  String? _showName;
  String? _rightCorner;
  String? _rightCornerImg;

  List _datas = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showName = widget.floor?["showName"] ?? "";
    _rightCorner = widget.floor?["rightCorner"] ?? "";
    _rightCornerImg = widget.floor?["rightCornerImg"] ?? "";

    if (widget.floor != null && widget.subFloors!.isNotEmpty) {
      Map first = widget.subFloors?.first;
      _datas = first["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        // border: Border.all(width: 1, color: Colors.green),
        color: Colors.white,
        borderRadius: HzyNormalTools.buildFeedCellRadius(1, 0),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: <Widget>[
            _buildTopView(),
            _buildListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      height: 120,
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1, color: Colors.green),
      // ),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: _datas.length,
        itemBuilder: (context, index) {
          String img = _datas[index]["img"] ?? "";
          String showName = _datas[index]["showName"] ?? "";
          String channelLogo = _datas[index]["channelLogo"] ?? "";

          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(showName),
              ));
            },
            child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(width: 1, color: Colors.green),
              // ),
              width: 200,
              height: double.infinity,
              padding: const EdgeInsets.only(right: 10),
              child: CommonExtendedImageWidget.netWorkImget(
                url: img,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // height: 30,
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: const BoxDecoration(
                // border: Border.all(width: 1, color: Colors.green),
                ),
            child: Text("$_showName", style: const TextStyle(fontSize: 15)),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(_showName ?? ""),
              ));
            },
            child: Row(
              children: <Widget>[
                Text("$_rightCorner ", style: const TextStyle(fontSize: 12)),
                CommonExtendedImageWidget.netWorkImget(
                  url: _rightCornerImg ?? '',
                  width: 12,
                  height: 12,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
