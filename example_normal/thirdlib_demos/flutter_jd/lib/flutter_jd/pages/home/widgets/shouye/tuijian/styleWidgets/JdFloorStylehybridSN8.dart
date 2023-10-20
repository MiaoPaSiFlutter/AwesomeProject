// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class HomeHybrid_8 extends StatefulWidget {
  final int? subFloorNum;
  final List? subFloors;
  const HomeHybrid_8({
    Key? key,
    this.subFloorNum,
    this.subFloors,
  }) : super(key: key);

  @override
  State createState() => _HomeHybrid_8State();
}

class _HomeHybrid_8State extends State<HomeHybrid_8> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true, //解决无限高度问题
      physics: const NeverScrollableScrollPhysics(), //禁用滑动事件
      itemCount: widget.subFloorNum,
      itemBuilder: (context, index) {
        Map floor = widget.subFloors?[index] ?? {};
        String subBgColor = floor["subBgColor"] ?? "#FFFFFFFF";
        List<Color> floorBgColors =
            subBgColor.split(",").map((e) => getColorFromHex(e)).toList();
        BorderRadius borderRadius =
            HzyNormalTools.buildFeedCellRadius(widget.subFloorNum, index);
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: floorBgColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: borderRadius,
          ),
          child: _getSubFloor(floor),
        );
      },
    );
  }

  Widget _getSubFloor(Map floor) {
    List flex = [];
    List items = floor["data"] ?? [];
    if (items.length == 2) {
      return _getSubFloor_1X2(items);
    }
    if (items.length == 4) {
      return _getSubFloor_1X4(items);
    }

    for (var item in items) {
      String showName = item["showName"] ?? "";
      String img = item["img"] ?? "";
      String img2 = item["img2"] ?? "";

      if (showName == "京东秒杀") {
        flex.add(2);
      } else {
        if (!HyzyTextTools.isEmpty(img) && !HyzyTextTools.isEmpty(img2)) {
          flex.add(2);
        } else {
          flex.add(1);
        }
      }
    }

    List<Widget> listWiget = [];
    for (var i = 0; i < flex.length; i++) {
      String showName = items[i]["showName"] ?? "";
      if (showName == "京东秒杀") {
        listWiget.add(
          Expanded(
            flex: flex[i],
            child: HomeHybrid_8_MiaoSha(moduleData: items[i]),
          ),
        );
      } else {
        if (flex[i] == 1) {
          listWiget.add(
            Expanded(
              flex: flex[i],
              child: HomeHybrid_8_Sku1(moduleData: items[i]),
            ),
          );
        } else if (flex[i] == 2) {
          listWiget.add(
            Expanded(
              flex: flex[i],
              child: HomeHybrid_8_Sku2(moduleData: items[i]),
            ),
          );
        }
      }
    }
    return Container(
      height: 120,
      child: Row(
        children: listWiget,
      ),
    );
  }

  //每行2个
  Widget _getSubFloor_1X2(List items) {
    return SizedBox(
      height: 120,
      child: Row(
        children: items.map((e) {
          return Expanded(
            child: HomeHybrid_8_Sku2(moduleData: e),
          );
        }).toList(),
      ),
    );
  }

  //每行4个
  Widget _getSubFloor_1X4(List items) {
    return SizedBox(
      height: 120,
      child: Row(
        children: items.map((e) {
          return Expanded(
            child: HomeHybrid_8_Sku1(moduleData: e),
          );
        }).toList(),
      ),
    );
  }
}

class HomeHybrid_8_MiaoSha extends StatelessWidget {
  final Map? moduleData;
  const HomeHybrid_8_MiaoSha({
    Key? key,
    this.moduleData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String showName = moduleData?["showName"] ?? "";
    String slogan = moduleData?["slogan"] ?? "";
    String message = moduleData?["message"] ?? ""; //"京东秒杀"
    String name = moduleData?["name"] ?? ""; //"16点场"
    List indexMiaoSha = moduleData?["content"]?["indexMiaoSha"] ?? [];

    List imgs = [];
    for (var item in indexMiaoSha) {
      String imageurl = item["imageurl"] ?? "";
      if (!HyzyTextTools.isEmpty(imageurl)) {
        imgs.add(imageurl);
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            showName,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            slogan,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(children: _getGoods(context, imgs)),
          ),
        ),
      ],
    );
  }

  List<Widget> _getGoods(BuildContext context, List imgs) {
    List<Widget> goods = [];
    for (var item in imgs) {
      goods.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(item),
              ));
            },
            child: CommonExtendedImageWidget.netWorkImget(url: item),
          ),
        ),
      );
    }
    return goods;
  }
}

class HomeHybrid_8_Sku2 extends StatelessWidget {
  final Map? moduleData;
  const HomeHybrid_8_Sku2({
    Key? key,
    this.moduleData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String showName = moduleData?["showName"] ?? "";
    String slogan = moduleData?["slogan"] ?? "";
    List imgs = [];
    String img = moduleData?["img"] ?? "";
    String img2 = moduleData?["img2"] ?? "";
    if (!HyzyTextTools.isEmpty(img)) {
      imgs.add(img);
    }
    if (!HyzyTextTools.isEmpty(img2)) {
      imgs.add(img2);
    }

    if (imgs.length == 2) {
      return Container(
        // decoration: BoxDecoration(
        //   border: Border.all(width: 1, color: Colors.red),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                showName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                slogan,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Row(children: _getGoods(context, imgs)),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> _getGoods(BuildContext context, List imgs) {
    List<Widget> goods = [];
    for (var item in imgs) {
      goods.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(item),
              ));
            },
            child: CommonExtendedImageWidget.netWorkImget(url: item),
          ),
        ),
      );
    }
    return goods;
  }
}

class HomeHybrid_8_Sku1 extends StatelessWidget {
  final Map? moduleData;
  const HomeHybrid_8_Sku1({
    Key? key,
    this.moduleData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String showName = moduleData?["showName"] ?? "";
    String slogan = moduleData?["slogan"] ?? "";
    String img = moduleData?["img"] ?? "";

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(showName),
        ));
      },
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(width: 1, color: Colors.red),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                showName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                slogan,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: HyzyTextTools.isEmpty(img)
                    ? Container()
                    : Container(
                        padding: const EdgeInsets.all(5),
                        child: CommonExtendedImageWidget.netWorkImget(url: img),
                      )),
          ],
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final Map? listItem;
  final double? width;
  final double? height;

  const ListItemWidget({Key? key, this.listItem, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.red),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width! * 0.5,
              height: width! * 0.5,
              decoration: const BoxDecoration(color: Colors.grey),
              child: CommonExtendedImageWidget.netWorkImget(
                  url: listItem?["icon"] ?? ""),
            ),
            SizedBox(
              height: 24,
              child: Text(
                listItem?["name"] ?? "",
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(listItem?["name"] ?? ""),
        ));
      },
    );
  }
}
