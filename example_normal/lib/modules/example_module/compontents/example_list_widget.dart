/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 11:37:37
 * @LastEditors: TT
 * @LastEditTime: 2023-05-16 16:40:30
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:example_normal/modules/example_module/compontents/compontents.dart';
import 'package:example_normal/modules/example_module/models/image_model.dart';
import 'package:example_normal/modules/example_module/models/tu_chong_model.dart';

class ExampleListWidget extends CommonLessV {
  ExampleListWidget({
    super.key,
    required this.list,
    this.scrollController,
  });

  final List list;
  final ScrollController? scrollController;
  @override
  bool configIsNeedLayout() {
    return true;
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        return createItemBuilder(
          context,
          index,
          constraints: constraints,
        );
      },
      itemCount: list.length,
    );
    return body;
  }

  Widget createItemBuilder(BuildContext context, int index,
      {BoxConstraints? constraints}) {
    String? url = "";
    String? title;
    if (kIsWeb) {
      TuChongItem item = list[index];
      url = item.imageUrl;
      title = item.title;
    } else {
      ImageModel imageModel = list[index];
      url = imageModel.url ?? "";
      title = imageModel.title;
    }

    Widget body = conFigNetWorkImage(
      url: url,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
      width: SizeMacro.screenWidth - 60.w,
      height: (SizeMacro.screenWidth - 60.w) / 2,
      fit: BoxFit.fitWidth,
      loadradius: 15,
    );
    body = body = InkWell(
      onTap: () {
        if (url == null) {
          showToastMsg("图片链接获取失败，请稍后重试!!!");
        } else {
          tapImageItem(url: url);
        }
      },
      child: body,
    );
    Widget titleWidget = (title == null || title == "")
        ? Container()
        : Text(
            title,
            style: FontConfig.fontBold16Black,
            textAlign: TextAlign.start,
          );
    body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget,
        (title == null || title == "") ? Container() : Gaps.vGap10,
        body,
      ],
    );
    body = Container(
      margin: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        top: 15.w,
      ),
      padding: EdgeInsets.all(
        15.w,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HzyCommonColor().whitebackgroundColor,
        borderRadius: BorderRadius.circular(
          16.r,
        ),
        boxShadow: [
          configShadow(),
        ],
      ),
      child: body,
    );
    return body;
  }

  tapImageItem({required String url}) {
    configPopImage(
      imageurl: url,
    );
  }
}
