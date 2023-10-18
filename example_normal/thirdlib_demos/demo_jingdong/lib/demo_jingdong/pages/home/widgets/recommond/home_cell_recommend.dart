import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class HomeCellRecommend extends StatefulWidget {
  final List floors;
  const HomeCellRecommend(this.floors, {Key? key}) : super(key: key);

  @override
  State createState() => _HomeCellRecommendState();
}

class _HomeCellRecommendState extends State<HomeCellRecommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.red),
      ),
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // controller: _scrollController,
        slivers: <Widget>[
          SliverWaterfallFlow(
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0, //上下item间距
              crossAxisSpacing: 5.0, //左右item间距
              collectGarbage: (List<int> garbages) {
                print('collect garbage : $garbages');
              },
              viewportBuilder: (int firstIndex, int lastIndex) {
                print('viewport : [$firstIndex,$lastIndex]');
              },
              lastChildLayoutTypeBuilder: (index) =>
                  index == widget.floors.length
                      ? LastChildLayoutType.foot
                      : LastChildLayoutType.none,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext c, int index) {
                Map wareInfo = widget.floors[index];
                int itemType = wareInfo["itemType"] ?? 0;
                if (itemType == 66) {
                  return RecommendWareItem_66(wareInfo: wareInfo);
                }
                //显示单商品
                return RecommendWareItem_0(wareInfo: wareInfo);
              },
              childCount: widget.floors.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class RecommendWareItem_66 extends StatelessWidget {
  final Map? wareInfo;
  const RecommendWareItem_66({Key? key, this.wareInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: CommonExtendedImageWidget.netWorkImget(url: ""),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                "itemType=66",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendWareItem_0 extends StatelessWidget {
  final Map? wareInfo;
  const RecommendWareItem_0({Key? key, this.wareInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // NavigatorUtil.push(context, ProductRouter.product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _createImageView(),
              _createWnameView(),
              _createLabelListView(),
              _createPriceView(),
              _createPlusPriceView(),
            ],
          ),
        ),
      ),
    );
  }

  ///图片
  Widget _createImageView() {
    String imageurl = wareInfo?["imageurl"] ?? "";
    return AspectRatio(
      aspectRatio: 1,
      child: CommonExtendedImageWidget.netWorkImget(url: imageurl),
    );
  }

  ///商品名
  Widget _createWnameView() {
    String wname = wareInfo?["wname"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 13),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 2, bottom: 2),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF0033), Color(0xFFFF3333)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Text(
                      "自营",
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ),
                ),
              ),
              TextSpan(
                  text: HyzyTextTools.mpsfStr(wname),
                  style: const TextStyle(color: Colors.black)),
            ]),
      ),
    );
  }

  ///标签
  Widget _createLabelListView() {
    List labelList = wareInfo?["labelList"] ?? [];
    if (labelList.isEmpty) {
      return Container();
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start, //沿主轴方向居中
          children: labelList.map((e) {
            String labelTitle = e["labelTitle"] ?? "免息";
            return Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                labelTitle,
                style: const TextStyle(fontSize: 10, color: Colors.red),
              ),
            );
          }).toList(),
        ),
      );
    }
  }

  ///价格
  Widget _createPriceView() {
    String jdPrice = wareInfo?["jdPrice"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "￥${HyzyTextTools.mpsfStr(jdPrice)}",
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  ///价格
  Widget _createPlusPriceView() {
    bool isPlusWare = wareInfo?["isPlusWare"] ?? false;
    String tryPlusPrice = wareInfo?["tryPlusPrice"] ?? "";
    String priceIcon = wareInfo?["priceIcon"] ?? "";

    if (!isPlusWare) {
      return Container();
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Wrap(
          children: <Widget>[
            RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(children: <InlineSpan>[
                const TextSpan(
                  text: '￥',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                TextSpan(
                  text: HyzyTextTools.mpsfStr(tryPlusPrice),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: CommonExtendedImageWidget.netWorkImget(
                    url: priceIcon,
                    height: 9,
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
    }
  }
}
