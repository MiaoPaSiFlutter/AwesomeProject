// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JdFloorStyle0902 extends StatelessWidget {
  final Map? floor;
  const JdFloorStyle0902({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String style = floor?["style"] ?? "";
    String floorName = floor?["floorName"] ?? "";
    String rightImg = floor?["rightImg"] ?? "";
    String rightText = floor?["rightText"] ?? "";
    List content = floor?["content"];

    return Container(
      height: 150,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: content.length,
        itemBuilder: (BuildContext context, int position) {
          return _createGridViewItem(context, position); //布局样式自己定义
        },
      ),
    );
  }

  Widget _createGridViewItem(BuildContext context, int position) {
    List content = floor?["content"] ?? [];
    String img = content[position]["img"] ?? "";
    String sprice = content[position]["sprice"] ?? "";
    String jdPrice = content[position]["jdPrice"] ?? "";
    String saleRatio = content[position]["saleRatio"] ?? "";

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(img),
        ));
      },
      child: Container(
        width: 100,
        decoration: const BoxDecoration(
            // border: Border.all(width: 1, color: Colors.green),
            ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: CommonExtendedImageWidget.netWorkImget(
                    url: img, fit: BoxFit.contain),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    // border: Border.all(width: 1, color: Colors.green),
                    ),
                child: Column(
                  children: [
                    _createNewestPrice(context, position),
                    _createOlderPrice(context, position),
                    _createSaleRatio(context, position),
                    Text(
                      '已售$saleRatio%',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createNewestPrice(BuildContext context, int position) {
    List content = floor?["content"] ?? [];
    String img = content[position]["img"] ?? "";
    String name = content[position]["name"] ?? "";
    String sprice = content[position]["sprice"] ?? "";
    String jdPrice = content[position]["jdPrice"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: '￥',
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            TextSpan(
              text: sprice,
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createOlderPrice(BuildContext context, int position) {
    List content = floor?["content"] ?? [];
    String img = content[position]["img"] ?? "";
    String name = content[position]["name"] ?? "";
    String sprice = content[position]["sprice"] ?? "";
    String jdPrice = content[position]["jdPrice"] ?? "";
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.grey,
          ),
          children: [
            const TextSpan(
              text: '￥',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Color(0xff000000)),
            ),
            TextSpan(
              text: jdPrice,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSaleRatio(BuildContext context, int position) {
    List content = floor?["content"] ?? [];
    int saleRatio = 0;
    try {
      saleRatio = int.parse(content[position]["saleRatio"] ?? "");
    } catch (e) {
      dPrint("int.parse解析失败 $e");
    }
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
      width: double.infinity,
      height: 5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFEBCD), Color(0xFFFFFFFF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: saleRatio / 100,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            gradient: LinearGradient(
              colors: [Color(0xFFFF1493), Color(0xFFCD2626)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
    );
  }
}
