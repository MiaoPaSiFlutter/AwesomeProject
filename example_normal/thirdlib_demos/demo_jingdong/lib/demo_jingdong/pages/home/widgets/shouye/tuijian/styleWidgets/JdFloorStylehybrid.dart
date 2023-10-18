import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'JdFloorStylehybridSN1.dart';
import 'JdFloorStylehybridSN1111.dart';
import 'JdFloorStylehybridSN8.dart';
import 'JdFloorStylehybridSNdefault.dart';
import 'JdFloorStylehybridSNmeetingplace.dart';
import 'JdFloorStylehybridSNmychannel.dart';
import 'JdFloorStylehybridSNslidepage.dart';

class JdFloorStylehybrid extends StatefulWidget {
  final Map? floor;
  const JdFloorStylehybrid({
    Key? key,
    this.floor,
  }) : super(key: key);

  @override
  State createState() => _JdFloorStylehybridState();
}

class _JdFloorStylehybridState extends State<JdFloorStylehybrid> {
  String? _showName;
  String? _logoImage;
  int _subFloorNum = 0;
  List _subFloors = [];
  int _marginTop = 0;
  int _marginBottom = 0;
  String _cornerDegree = "0,0,0,0";

  @override
  void initState() {
    _configDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<double> cornerDegree = _cornerDegree.split(",").map((e) {
      return double.parse(e);
    }).toList();
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(cornerDegree[0]),
        topRight: Radius.circular(cornerDegree[1]),
        bottomLeft: Radius.circular(cornerDegree[2]),
        bottomRight: Radius.circular(cornerDegree[3]),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: _marginTop.toDouble(),
          bottom: _marginBottom.toDouble(),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Column(
          children: <Widget>[
            _getLogoView(),
            _getHybridBody(),
          ],
        ),
      ),
    );
  }

  /////////////🔥构造数据
  _configDatas() {
    _showName = null;
    _subFloorNum = 0;
    _subFloors.clear();
    _showName = widget.floor?["showName"] ?? "";
    _logoImage = widget.floor?["logoImage"] ?? "";
    _subFloorNum = widget.floor?["content"]?["subFloorNum"] ?? "";
    _subFloors = widget.floor?["content"]?["subFloors"] ?? [];
    _marginTop = widget.floor?["marginTop"] ?? 0;
    _marginBottom = widget.floor?["bottomMargin"] ?? 0;
    _cornerDegree = HyzyTextTools.mpsfStr(widget.floor?["cornerDegree"],
        placehold: "0,0,0,0");
  }

  Widget _getLogoView() {
    if (HyzyTextTools.isEmpty(_logoImage)) {
      return Container();
    }
    return CommonExtendedImageWidget.netWorkImget(url: _logoImage!);
  }

  Widget _getHybridBody() {
    if (_showName == "1") {
      return HomeHybrid_1(
        subFloorNum: _subFloorNum,
        subFloors: _subFloors,
      );
    } else if (_showName == "1111") {
      return HomeHybrid_1111(
        subFloorNum: _subFloorNum,
        subFloors: _subFloors,
      );
    } else if (_showName == "10.0") {
      return HomeHybrid_8(
        subFloorNum: _subFloorNum,
        subFloors: _subFloors,
      );
    } else if (_showName == "我的频道") {
      return HomeHybrid_MyChannel(
        floor: widget.floor,
        subFloorNum: _subFloorNum,
        subFloors: _subFloors,
      );
    } else if (_showName == "滑动通栏") {
      return HomeHybrid_SlidePage(
        floor: widget.floor,
        subFloorNum: _subFloorNum,
        subFloors: _subFloors,
      );
    } else if (_showName == "精选会场") {
      return HomeHybrid_MeetingPlace(
        floor: widget.floor,
        subFloorNum: _subFloorNum,
        subFloors: _subFloors,
      );
    } else if (_showName == "默认") {
      return HomeHybrid_Default(
        floor: widget.floor,
        subFloorNum: _subFloorNum,
        subFloors: _subFloors,
      );
    }

    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      color: Colors.grey[300],
      child: JdCommonCard(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
          child: Center(child: Text("$_showName")),
        ),
      ),
    );
  }
}
