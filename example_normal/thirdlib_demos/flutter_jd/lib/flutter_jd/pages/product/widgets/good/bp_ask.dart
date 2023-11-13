import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../vm/product_detail_viewmodel.dart';

class BpBpAsk extends StatelessWidget {
  const BpBpAsk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          _buildCommentInfoList(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text("问答",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommentInfoList(BuildContext context) {
    Map commentInfoData =
        context.watch<ProductDetailViewModel>().commentInfoData;
    List questionList = commentInfoData["questionList"] ?? [];
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questionList.length,
      itemBuilder: (context, index) {
        String content = questionList[index]["content"] ?? "";
        String answerCountText = questionList[index]["answerCountText"] ?? "";
        return Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonExtendedImageWidget.netWorkImget(url: "", width: 10),
                  Expanded(
                    child: Text(content, style: const TextStyle(fontSize: 12)),
                  )
                ],
              ),
            ),
            Text(answerCountText, style: const TextStyle(fontSize: 12)),
          ],
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    Map commentInfoData =
        context.watch<ProductDetailViewModel>().commentInfoData;
    String newStyleText = commentInfoData["newStyleText"] ?? "";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent.withAlpha(60),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Text(newStyleText, style: const TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
