// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import 'mpsf_jd_image_util.dart';

class HomeHybrid_Default extends StatelessWidget {
  final Map? floor;
  final int? subFloorNum;
  final List? subFloors;
  const HomeHybrid_Default({
    Key? key,
    this.floor,
    this.subFloorNum,
    this.subFloors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        List datas = [];
        if (subFloors != null && subFloors!.isNotEmpty) {
          for (var item in subFloors!) {
            datas.addAll(item["data"]);
          }
        }
        if (datas.length == 1) {
          return _buildView_1X1(context, datas);
        }
        if (datas.length == 3) {
          return _buildView_1X3(context, datas, screenWidth);
        }
        return Container();
      },
    );
  }

  ///每行占1个
  Widget _buildView_1X1(BuildContext context, List datas) {
    String img = datas.first?["img"] ?? "";
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(img),
        ));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          // border: Border.all(width: 1, color: Colors.green),
        ),
        child: CommonExtendedImageWidget.netWorkImget(url: img),
      ),
    );
  }

  ///每行占3个（三等分）
  Widget _buildView_1X3(BuildContext context, List datas, double screenWidth) {
    String img = datas.first?["img"] ?? "";
    List frame = MpsfJdImageUtil.getImageFrameFormUrl(img);
    double aspectRatio = frame.first / frame.last;

    double itemW = (screenWidth - 5 * 2) / 3;
    double itemH = itemW / aspectRatio;
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //每行数量
        mainAxisSpacing: 0.0, //主轴(竖直)方向间距
        crossAxisSpacing: 0.0, //纵轴(水平)方向间距
        childAspectRatio: itemW / itemH, //纵轴缩放比例
      ),
      itemCount: datas.length,
      itemBuilder: (context, index) {
        String img = datas[index]["img"] ?? "";
        String showName = datas[index]["showName"] ?? "";
        String channelLogo = datas[index]["channelLogo"] ?? "";
        String moduleBgImg = datas[index]["moduleBgImg"] ?? "";
        List frame = MpsfJdImageUtil.getImageFrameFormUrl(img);

        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(showName),
            ));
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              // border: Border.all(width: 1, color: Colors.green),
            ),
            child: CommonExtendedImageWidget.netWorkImget(url: img),
          ),
        );
      },
    );
  }
}
