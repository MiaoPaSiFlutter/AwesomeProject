// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 首页-我的频道
class HomeHybrid_MeetingPlace extends StatefulWidget {
  final Map? floor;
  final int? subFloorNum;
  final List? subFloors;
  const HomeHybrid_MeetingPlace({
    Key? key,
    this.floor,
    this.subFloorNum,
    this.subFloors,
  }) : super(key: key);

  @override
  State createState() => _HomeHybrid_MeetingPlaceState();
}

class _HomeHybrid_MeetingPlaceState extends State<HomeHybrid_MeetingPlace> {
  String? _showName;
  String? _rightCorner;
  String? _rightCornerImg;

  final List _datas = [];
  @override
  void initState() {
    super.initState();
    _showName = widget.floor?["showName"] ?? "";
    _rightCorner = widget.floor?["rightCorner"] ?? "";
    _rightCornerImg = widget.floor?["rightCornerImg"] ?? "";

    if (widget.subFloors != null && widget.subFloors!.isNotEmpty) {
      for (var item in widget.subFloors!) {
        _datas.addAll(item["data"]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.green),
        // color: Colors.white,
        borderRadius: HzyNormalTools.buildFeedCellRadius(1, 0),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: <Widget>[
            _buildListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(), //增加
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, //每行数量
          mainAxisSpacing: 5.0, //主轴(竖直)方向间距
          crossAxisSpacing: 5.0, //纵轴(水平)方向间距
          childAspectRatio: 0.7 //纵轴缩放比例
          ),
      itemCount: _datas.length,
      itemBuilder: (context, index) {
        String img = _datas[index]["img"] ?? "";
        String showName = _datas[index]["showName"] ?? "";
        String channelLogo = _datas[index]["channelLogo"] ?? "";
        String moduleBgImg = _datas[index]["moduleBgImg"] ?? "";

        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(showName),
            ));
          },
          child: Container(
            decoration: const BoxDecoration(color: Colors.white
                // border: Border.all(width: 1, color: Colors.green),
                ),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 0.7,
                  child:
                      CommonExtendedImageWidget.netWorkImget(url: moduleBgImg),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.green),
                        ),
                    child: CommonExtendedImageWidget.netWorkImget(url: img),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.green),
                        ),
                    child: Align(
                      child:
                          Text(showName, style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // return Container(
    //   height: 82,
    //   child: ListView.builder(
    //     padding: EdgeInsets.all(0),
    //     scrollDirection: Axis.horizontal,
    //     itemCount: _datas.length,
    //     itemBuilder: (context, index) {
    //       String img = _datas[index]["img"];
    //       String showName = _datas[index]["showName"];
    //       String channelLogo = _datas[index]["channelLogo"];
    //       String moduleBgImg = _datas[index]["moduleBgImg"];

    //       return GestureDetector(
    //         onTap: () {
    //           Scaffold.of(context).showSnackBar(SnackBar(
    //             content: Text(showName),
    //           ));
    //         },
    //         child: Container(
    //           width: 80,
    //           decoration: BoxDecoration(
    //               // border: Border.all(width: 1, color: Colors.green),
    //               ),
    //           child: Column(
    //             children: <Widget>[
    //               CommonNetworkImage(
    //                 img,
    //                 height: 50,
    //                 fit: BoxFit.contain,
    //               ),
    //               Container(
    //                 height: 30,
    //                 decoration: BoxDecoration(
    //                     // border: Border.all(width: 1, color: Colors.green),
    //                     ),
    //                 child: Align(
    //                   alignment: Alignment.centerLeft,
    //                   child: Row(
    //                     children: <Widget>[
    //                       CommonNetworkImage(
    //                         channelLogo,
    //                         width: 15,
    //                         height: 15,
    //                       ),
    //                       Text("$showName", style: TextStyle(fontSize: 12))
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
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
            child: Text("$_showName", style: TextStyle(fontSize: 15)),
          ),
          Container(
            child: GestureDetector(
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
          ),
        ],
      ),
    );
  }
}
