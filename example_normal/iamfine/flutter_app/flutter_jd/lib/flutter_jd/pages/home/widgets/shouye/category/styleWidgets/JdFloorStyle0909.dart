// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

class JdFloorStyle0909 extends StatelessWidget {
  final Map? floor;
  const JdFloorStyle0909({Key? key, this.floor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String style = floor?["style"] ?? "";
    String floorName = floor?["floorName"] ?? "";
    String rightImg = floor?["rightImg"] ?? "";
    String rightText = floor?["rightText"] ?? "";
    List content = floor?["content"];
    return Container(
      height: 80,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        itemCount: content.length,
        itemBuilder: (context, index) {
          String discount = content[index]["discount"] ?? "";
          String couponTitle = content[index]["couponTitle"] ?? "";
          String couponSubTitle = content[index]["couponSubTitle"] ?? "";

          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(couponTitle),
              ));
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.green),
                color: Colors.white,
                borderRadius: HzyNormalTools.buildFeedCellRadius(1, 0),
              ),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "¥$discount",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      couponTitle,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      couponSubTitle,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
