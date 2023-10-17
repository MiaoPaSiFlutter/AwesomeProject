import 'package:demo_jingdong/demo_jingdong.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'mid_info_headerview.dart';
import 'small_collection_item.dart';
import '../mine_view.dart';

class MineOrderIdFloorCell extends StatelessWidget {
  final Map? floor;
  const MineOrderIdFloorCell({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _buildHeaderInfoView(context),
          _buildAttentionView(context),
          _buildGridView(context),
        ],
      ),
    );
  }

  //////////////////////////
  ////////////////////////// 标题
  //////////////////////////
  Widget _buildHeaderInfoView(BuildContext context) {
    return GestureDetector(
      child: const MidInfoHeaderView(labelName: "订单查询"),
      onTap: () {},
    );
  }

  //////////////////////////
  ////////////////////////// 商品收藏 + 店铺关注 + 浏览记录
  //////////////////////////
  Widget _buildAttentionView(BuildContext context) {
    return GetBuilder<MineController>(
      builder: (controller) {
        // return Text("${controller.listDatas}");
        List attentionList = [];
        for (var element in controller.listDatas) {
          if (element["mId"] == "attentionFloor") {
            attentionList = element["data"]?["attentionList"] ?? [];
          }
        }
        List<Widget> children = attentionList.map((e) {
          return Expanded(
            child: InkWell(
              child: AttentionItem(
                numImage: e["numImage"],
                title: e["title"]?["value"],
                titleColor: e["title"]?["color"],
                number: "2",
              ),
              onTap: () {
                int index = attentionList.indexOf(e);
                if (index == 0) {
                  // currentToPage(MyPageId.COLLECT);
                } else if (index == 1) {
                  // NavigatorUtil.push(context, "/account/storeAttention");
                } else if (index == 2) {
                  currentToPage(JingDongModuleRouterS.BrowseHistoryView);
                }
              },
            ),
          );
        }).toList();
        return Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Row(children: children),
        );
      },
    );
  }

  //////////////////////////
  ////////////////////////// GridView
  //////////////////////////
  Widget _buildGridView(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        List orderList = floor?["data"]?["orderList"] ?? [];
        double screenWidth = p1.maxWidth;
        double itemCardW = (screenWidth) / 5;
        double itemCardH = 40 + 40;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          itemCount: orderList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: itemCardW / itemCardH,
          ),
          itemBuilder: (context, index) {
            Map node = orderList[index];
            return _cellBuilder(context, node);
          },
        );
      },
    );
  }

  Widget _cellBuilder(BuildContext context, Map node) {
    String title = node["title"]?["value"] ?? "";
    return GestureDetector(
      onTap: () {
        if (title == "待付款") {
          currentToPage(JingDongModuleRouterS.OrderView,
              parameters: {"index": "1"});
        } else if (title == "待收货") {
          currentToPage(JingDongModuleRouterS.OrderView,
              parameters: {"index": "2"});
        } else if (title == "待评价") {
        } else if (title == "退换/售后") {
        } else if (title == "我的订单") {
          currentToPage(JingDongModuleRouterS.OrderView,
              parameters: {"index": "0"});
        }
      },
      child: SmallCollectionItem(
        imageUrl: node["safeImage"],
        title: title,
        subtitle: node["subtitle"]?["value"],
        redDotValue: 3,
      ),
    );
  }
}

class AttentionItem extends StatelessWidget {
  final String? numImage;
  final String? title;
  final String? titleColor;
  final String? number;

  const AttentionItem({
    Key? key,
    this.numImage,
    this.title,
    this.titleColor,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.clip,
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: CommonExtendedImageWidget.netWorkImget(
                url: numImage ?? '', width: 15),
          ),
          TextSpan(text: title, style: FontConfig().fontBold12Black),
          TextSpan(text: number, style: FontConfig().fontBold12Black),
        ],
      ),
    );
  }
}
