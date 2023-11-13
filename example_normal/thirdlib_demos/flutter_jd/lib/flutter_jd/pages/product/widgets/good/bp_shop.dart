// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../vm/product_detail_viewmodel.dart';

class BpBpShop extends StatelessWidget {
  const BpBpShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          _buildHeader(context),
          _buildTagStatisticsinfoList(context),
          _buildCommentInfoList(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    Map bpMasterdata = context.watch<ProductDetailViewModel>().bpMasterdata;
    Map shopInfo = bpMasterdata["data"]?["shopInfo"] ?? {};
    Map shop = shopInfo["shop"] ?? {};
    String name = shop["name"] ?? ""; //店铺名字
    String logo = shop["logo"] ?? ""; //店铺logo

    String followText = shop["followText"] ?? ""; //关注
    int followCount = shop["followCount"] ?? 0; //关注人数

    String evaluateTxt = shop["evaluateTxt"] ?? ""; //评价
    String evaluateScore = shop["evaluateScore"] ?? "";
    String evaluateGrade = shop["evaluateGrade"] ?? "";
    String logisticsTxt = shop["logisticsTxt"] ?? ""; //物流
    String logisticsScore = shop["logisticsScore"] ?? "";
    String logisticsGrade = shop["logisticsGrade"] ?? "";
    String afterSaleTxt = shop["afterSaleTxt"] ?? ""; //售后
    String afterSaleScore = shop["afterSaleScore"] ?? "";
    String afterSaleGrade = shop["afterSaleGrade"] ?? "";

    return Row(
      children: [
        CommonExtendedImageWidget.netWorkImget(
            url: logo, width: 40, height: 40),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [Text(name, style: const TextStyle(fontSize: 13))],
              ),
              Wrap(
                children: [
                  _creatTSG(evaluateTxt, evaluateScore, evaluateGrade),
                  _creatTSG(logisticsTxt, logisticsScore, logisticsGrade),
                  _creatTSG(afterSaleTxt, afterSaleScore, afterSaleGrade),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _creatTSG(String txt, String score, String grade) {
    return RichText(
      overflow: TextOverflow.clip,
      text: TextSpan(
        children: [
          TextSpan(
            text: txt,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          TextSpan(
            text: "$score $grade",
            style: const TextStyle(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildTagStatisticsinfoList(BuildContext context) {
    Map bpMasterdata = context.watch<ProductDetailViewModel>().bpMasterdata;
    Map shopInfo = bpMasterdata["data"]?["shopInfo"] ?? {};
    Map shop = shopInfo["shop"] ?? {};
    List promotions = shop["promotions"] ?? [];
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: 5, //左右间距
        runSpacing: 5, //上下间距
        children: promotions.map((e) {
          Map coupon = e;
          String text = coupon["name"];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.pinkAccent.shade100,
              padding: const EdgeInsets.all(5),
              child: Text(text, style: const TextStyle(fontSize: 12)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCommentInfoList(BuildContext context) {
    Map bpMasterdata = context.watch<ProductDetailViewModel>().bpMasterdata;
    Map shopInfo = bpMasterdata["data"]?["shopInfo"] ?? {};
    Map shop = shopInfo["shop"] ?? {};
    List hotcates = shop["hotcates"] ?? [];
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: hotcates.length,
        itemBuilder: (context, index) {
          String imgPath = hotcates[index]["imgPath"] ?? "";
          return CommonExtendedImageWidget.netWorkImget(
              url: imgPath, width: 100);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.blueAccent.withAlpha(60),
              width: 1.0,
            ),
          ),
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("精选商品", style: TextStyle(fontSize: 12)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.blueAccent.withAlpha(60),
              width: 1.0,
            ),
          ),
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("进店逛逛", style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
