import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'WaterfallFlowTabRepository.dart';

class WaterfallFlowTabWidget extends StatefulWidget {
  const WaterfallFlowTabWidget(this.tabKey, this.tabInfo);

  final Key tabKey;
  final Map tabInfo;

  @override
  _WaterfallFlowTabWidgetState createState() => _WaterfallFlowTabWidgetState();
}

class _WaterfallFlowTabWidgetState extends State<WaterfallFlowTabWidget>
    with AutomaticKeepAliveClientMixin {
  late TuChongRepository listSourceRepository;

  @override
  void initState() {
    super.initState();
    listSourceRepository = TuChongRepository(widget.tabInfo);
  }

  @override
  void dispose() {
    listSourceRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Widget child = ExtendedVisibilityDetector(
      uniqueKey: widget.tabKey,
      child: GlowNotificationWidget(
        LoadingMoreList<dynamic>(
          ListConfig<dynamic>(
            extendedListDelegate:
                const SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, item, index) {
              return RecommendWareItem_0(wareInfo: item);
            },
            sourceList: listSourceRepository,
            padding: const EdgeInsets.all(5.0),
            lastChildLayoutType: LastChildLayoutType.foot,
          ),
        ),
        showGlowLeading: false,
      ),
    );

    return child;
  }

  @override
  bool get wantKeepAlive => true;
}

class RecommendWareItem_0 extends StatelessWidget {
  final Map? wareInfo;
  const RecommendWareItem_0({Key? key, this.wareInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // currentToPage(CommonPageId.PRODUCT);
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
              // _createPriceView(),
              // _createPlusPriceView(),
            ],
          ),
        ),
      ),
    );
  }

  ///图片
  Widget _createImageView() {
    String imageurl = wareInfo?["skuImg"] ?? "";
    return AspectRatio(
      aspectRatio: 1,
      child: CommonExtendedImageWidget.configImage(imageUrl: imageurl),
    );
  }

  ///商品名
  Widget _createWnameView() {
    String wname = wareInfo?["skuName"] ?? "";
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
                  style: const TextStyle(color: Colors.black))
            ]),
      ),
    );
  }

  ///标签
  Widget _createLabelListView() {
    List labelList = wareInfo?["benefits"] ?? [];
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
            String labelTitle = e["title"] ?? "免息";
            return Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(labelTitle,
                  style: const TextStyle(fontSize: 10, color: Colors.red)),
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
                  child: CommonExtendedImageWidget.configImage(
                    imageUrl: priceIcon,
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
