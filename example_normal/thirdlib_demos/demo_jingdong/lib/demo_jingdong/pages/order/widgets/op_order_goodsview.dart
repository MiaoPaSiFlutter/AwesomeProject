import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class OPOrderGoodsView extends StatefulWidget {
  final Map floor;
  const OPOrderGoodsView({
    Key? key,
    this.floor = const {},
  }) : super(key: key);

  @override
  State createState() => _OPOrderGoodsViewState();
}

class _OPOrderGoodsViewState extends State<OPOrderGoodsView> {
  @override
  Widget build(BuildContext context) {
    List wareInfoList = widget.floor["orderMsg"]?["wareInfoList"] ?? [];
    if (wareInfoList.isNotEmpty) {
      if (wareInfoList.length == 1) {
        return _createSingleGoodView(context);
      } else {
        return _createMultipleGoodsView(context);
      }
    }

    String? shopName = widget.floor["shopName"];
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: Text(
        HyzyTextTools.mpsfStr(shopName),
      ),
    );
  }

  ///单个商品展示
  Widget _createSingleGoodView(context) {
    List wareInfoList = widget.floor["orderMsg"]?["wareInfoList"] ?? [];
    String imageUrl = wareInfoList.first["imageurl"];
    String wname = wareInfoList.first["wname"];
    String wareCountMessageNew = widget.floor["wareCountMessageNew"];
    String listPrice = widget.floor["listPrice"];

    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        children: [
          InkWell(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CommonExtendedImageWidget.netWorkImget(
                    url: HyzyTextTools.mpsfStr(imageUrl)),
              ),
            ),
            onTap: () {
              // currentToPage(CommonPageId.PRODUCT);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                wname,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: HyzyTextTools.mpsfStr(listPrice),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: HyzyTextTools.mpsfStr(wareCountMessageNew),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  ///多个商品展示
  Widget _createMultipleGoodsView(context) {
    List wareInfoList = widget.floor["orderMsg"]?["wareInfoList"] ?? [];
    String wareCountMessageNew = widget.floor["wareCountMessageNew"];
    String listPrice = widget.floor["listPrice"];

    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: wareInfoList.length,
              itemBuilder: (context, index) {
                Map info = wareInfoList[index];
                String imageUrl = info["imageurl"];
                return InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CommonExtendedImageWidget.netWorkImget(
                        url: HyzyTextTools.mpsfStr(imageUrl)),
                  ),
                  onTap: () {
                    // currentToPage(CommonPageId.PRODUCT);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 5);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: HyzyTextTools.mpsfStr(listPrice),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: HyzyTextTools.mpsfStr(wareCountMessageNew),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
