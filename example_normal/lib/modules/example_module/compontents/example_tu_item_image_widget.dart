import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../models/tu_chong_model.dart';
import '../routers/example_module_routers.dart';
import 'compontents.dart';

class ExampleTuItmeImagelessV extends CommonLessV {
  ExampleTuItmeImagelessV({
    super.key,
    required this.tuChongItem,
  });
  final TuChongItem tuChongItem;
  @override
  bool get isNeedScaffol => false;
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configImageListWidget();

    body = Padding(
      padding: const EdgeInsets.all(5),
      child: body,
    );
    return body;
  }

  /// 配置图片数组视图
  configImageListWidget() {
    if (tuChongItem.realImages?.length == 1) {
      return configOnlyOneImageWidget();
    } else {
      return GridView.count(
        crossAxisCount: tuChongItem.crossAxisCount ?? 1,
        childAspectRatio: tuChongItem.crossAxisCount == 2 ? 1 : 1,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...List.generate(
              tuChongItem.realImages!.length > 9
                  ? 9
                  : tuChongItem.realImages!.length, (index) {
            Widget body = configImageItem(
              imageUrl: tuChongItem.realImages![index],
              index: index,
              allNum: tuChongItem.images?.length ?? 0,
            );
            return body;
          })
        ],
      );
    }
  }

  /// 配置单图视图
  configOnlyOneImageWidget() {
    Widget body = LayoutBuilder(
      builder: (p0, p1) {
        ImageItem imageItem = tuChongItem.images![0];
        double ratio = (imageItem.width ?? 0) / (imageItem.height ?? 1);
        double imageH = p1.maxWidth / ratio;
        Widget body = configTuchongImageWidget(
          url: imageItem.imageUrl,
          width: p1.maxWidth,
          height: imageH,
          index: 0,
        );
        return body;
      },
    );
    return body;
  }

  @override
  configBoxDecoreation() {
    return BoxDecoration(
      color: HzyCommonColor().backgroudgrey,
      borderRadius: BorderRadius.circular(
        4.r,
      ),
    );
  }

  /// 配置图片item
  configImageItem({
    required String imageUrl,
    required int index,
    required int allNum,
  }) {
    Widget body = LayoutBuilder(
      builder: (p0, p1) {
        /// 加载图片
        Widget body = configTuchongImageWidget(
          url: imageUrl,
          width: p1.maxWidth,
          height: p1.maxHeight,
          index: index,
          isTap: false,
        );
        return body;
      },
    );
    if (index == 8 && allNum > (index + 1)) {
      body = Stack(
        children: [
          body,
          Positioned.fill(
            child: configResidueNumWidget(num: allNum - 9),
          )
        ],
      );
    }
    body = InkWell(
      onTap: () {
        currentToPage(
          ExampleModuleRouterS.tudetail,
          arguments: tuChongItem,
          parameters: {"index": "$index"},
        );
      },
      child: body,
    );

    return body;
  }

  /// 配置图片显示视图
  configTuchongImageWidget({
    String? url,
    double? width,
    double? height,
    bool isTap = true,
    required int index,
  }) {
    Widget body = configHeroNetImageWidget(
      url: url,
      width: width,
      height: height,
    );

    body = isTap
        ? InkWell(
            onTap: () {
              currentToPage(
                ExampleModuleRouterS.tudetail,
                arguments: tuChongItem,
                parameters: {"index": "$index"},
              );
            },
            child: body,
          )
        : body;

    return body;
  }

  /// 创建图片剩余个数
  configResidueNumWidget({required int num}) {
    Widget body = Text(
      "+$num",
      style: HzyTextStyle.fontBold(
        size: 16.sp,
        color: Colors.white,
      ),
    );
    body = Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
      ),
      alignment: Alignment.center,
      child: body,
    );
    return body;
  }
}
