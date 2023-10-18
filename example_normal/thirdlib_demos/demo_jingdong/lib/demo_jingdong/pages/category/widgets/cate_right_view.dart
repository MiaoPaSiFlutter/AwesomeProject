import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../models/entrance_catalogItem.dart';

class CateRightView extends StatefulWidget {
  final EntranceCatalogItem item;
  final double width;
  const CateRightView({
    Key? key,
    required this.width,
    required this.item,
  }) : super(key: key);

  @override
  State createState() => _CateRightViewState();
}

class _CateRightViewState extends State<CateRightView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isloading = false;
  List sections = [];
  List cmsPromotionsList = [];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (isloading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          // SliverGrid.count(
          //   crossAxisCount: 4,
          //   children: List.generate(8, (index) {
          //     return Container(
          //       color: Colors.primaries[index % Colors.primaries.length],
          //       alignment: Alignment.center,
          //       child: Text(
          //         '$index',
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //     );
          //   }).toList(),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((content, index) {
          //     return Container(
          //       height: 85,
          //       alignment: Alignment.center,
          //       color: Colors.primaries[index % Colors.primaries.length],
          //       child: Text(
          //         '$index',
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //     );
          //   }, childCount: 25),
          // ),
          _buildListView()
        ],
      ),
    );
  }

  Widget _buildListView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: sections.length,
          (content, index) {
        return _creatSectionItemBuilder(context, index);
      }),
    );
  }

  Widget _creatSectionItemBuilder(context, index) {
    Map safeMap = sections[index];
    String name = safeMap["name"] ?? "---";
    int columNum = safeMap["columNum"] ?? "---";
    List catelogyLists = safeMap["catelogyList"] ?? [];

    EdgeInsets padding = const EdgeInsets.all(5);

    double itemCardW = (widget.width - padding.left - padding.right) / 3;
    double itemCardH = 30 + itemCardW;
    // print("itemCardW = " + itemCardW.toString());
    // print("itemCardH = " + itemCardH.toString());
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(4, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(name),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              itemCount: catelogyLists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: columNum,
                  //纵轴间距
                  mainAxisSpacing: 0.0,
                  //横轴间距
                  crossAxisSpacing: 0.0,
                  //子组件宽高长度比例
                  childAspectRatio: itemCardW / itemCardH),
              itemBuilder: (context, index) {
                String icon = catelogyLists[index]["icon"];
                String name = catelogyLists[index]["name"];

                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(name),
                    ));
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(name,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )))),
                      CommonExtendedImageWidget.netWorkImget(
                        url: icon,
                        width: itemCardW * 0.8,
                        height: itemCardW * 0.8,
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    isloading = true;
    setState(() {});

    ///分类信息
    MpsfResponse resp = await JdService.newSubCatalog(widget.item.cid!);
    List list = resp.jsonData["data"] ?? [];
    for (var f in list) {
      sections.add(f);
    }

    {
      ///促销信息
      MpsfResponse resp = await JdService.getCmsPromotionsListByCatelogyID();
      List list = resp.jsonData["cmsPromotionsList"] ?? [];
      for (var f in list) {
        cmsPromotionsList.add(f["imageUrl"]);
      }
    }
    isloading = false;
    setState(() {});
  }
}
