import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:provider/provider.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpEvaluate extends StatefulWidget {
  const BpBpEvaluate({Key? key}) : super(key: key);

  @override
  State createState() => _BpBpEvaluateState();
}

class _BpBpEvaluateState extends State<BpBpEvaluate> {
  GlobalKey anchorKey = GlobalKey();

  @override
  initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _afterLayout();
    // });
    print("BpBpEvaluate - initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          _buildHeader(context),
          _buildTagStatisticsinfoList(context),
          _buildCommentInfoList(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    Map commentInfoData =
        context.watch<ProductDetailViewModel>().commentInfoData;
    String allCntStr = commentInfoData["allCntStr"] ?? ""; //评价数
    String goodRate = commentInfoData["goodRate"] ?? ""; //好评数
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Text("评价",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                Text(allCntStr, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Text("好评度$goodRate", style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTagStatisticsinfoList(BuildContext context) {
    Map commentInfoData =
        context.watch<ProductDetailViewModel>().commentInfoData;
    List iconList = commentInfoData["tagStatisticsinfoList"] ?? [];
    return Container(
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: 5, //左右间距
        runSpacing: 5, //上下间距
        children: iconList.map((e) {
          Map coupon = e;
          String text = coupon["name"];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.pink.shade50,
              padding: const EdgeInsets.all(5),
              child: Text(text,
                  style: const TextStyle(fontSize: 12, color: Colors.pink)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCommentInfoList(BuildContext context) {
    Map commentInfoData =
        context.watch<ProductDetailViewModel>().commentInfoData;
    List commentInfoList = commentInfoData["commentInfoList"] ?? [];
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: commentInfoList.length,
      itemBuilder: (context, index) {
        return _commentInfo(commentInfoList[index]);
      },
    );
  }

  Widget _commentInfo(Map commentInfo) {
    String userImgURL = commentInfo["userImgURL"] ?? "";
    String userNickName = commentInfo["userNickName"] ?? "";
    String commentScore = commentInfo["commentScore"] ?? "";
    String commentData = commentInfo["commentData"] ?? "";
    List pictureInfoList = commentInfo["pictureInfoList"] ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //头部
        Container(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              CommonExtendedImageWidget.netWorkImget(
                url: userImgURL,
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userNickName, style: const TextStyle(fontSize: 12)),
                    Text(commentScore, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
        //评论
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text(commentData, style: const TextStyle(fontSize: 12)),
        ),
        //晒图
        SizedBox(
          height: 80,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: pictureInfoList.length,
            itemBuilder: (context, index) {
              String picURL = pictureInfoList[index]["picURL"] ?? "";
              return CommonExtendedImageWidget.netWorkImget(
                  url: picURL, width: 80);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
          ),
        )
      ],
    );
  }
}
