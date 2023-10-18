import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

/// 首页-我的频道
class HomeHybrid_MyChannel extends StatefulWidget {
  final Map? floor;
  final int? subFloorNum;
  final List? subFloors;
  const HomeHybrid_MyChannel({
    Key? key,
    this.floor,
    this.subFloorNum,
    this.subFloors,
  }) : super(key: key);

  @override
  State createState() => _HomeHybrid_MyChannelState();
}

class _HomeHybrid_MyChannelState extends State<HomeHybrid_MyChannel> {
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

    if (widget.subFloors != null && widget.subFloors!.isNotEmpty) {
      Map first = widget.subFloors?.first;
      _datas = first["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(left: 12, right: 12),
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
      height: 82,
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
              width: 80,
              decoration: const BoxDecoration(
                  // border: Border.all(width: 1, color: Colors.green),
                  ),
              child: Column(
                children: <Widget>[
                  CommonExtendedImageWidget.netWorkImget(
                    url: img,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.green),
                        ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          CommonExtendedImageWidget.netWorkImget(
                            url: channelLogo,
                            width: 15,
                            height: 15,
                          ),
                          Text(showName, style: const TextStyle(fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                ],
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
