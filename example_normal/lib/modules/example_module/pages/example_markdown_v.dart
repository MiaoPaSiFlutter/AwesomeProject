/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-10 14:12:54
 * @LastEditors: TT
 * @LastEditTime: 2023-05-11 18:07:14
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../compontents/markdow_style.dart';

class ExampleMarkdownV extends CommonGetXWidget<ExampleMarkdownC> {
  ExampleMarkdownV({Key? key}) : super(key: key);
  @override
  ExampleMarkdownC get controller => Get.put(ExampleMarkdownC());
  @override
  String? createAppBarTitleStr() => controller.title;
  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = Markdown(
      data: controller.data,
      syntaxHighlighter: HighLight(),
      imageBuilder: (uri, title, alt) {
        String path = uri.path;
        if (uri.path.contains("/assets")) {
          path = uri.path.substring(1);
        }
        Widget body = Image.asset(
          path,
        );

        body = InkWell(
          onTap: () {
            controller.tapImage(path: path);
          },
          child: body,
        );
        return body;
      },
    );
    return body;
  }
}

class ExampleMarkdownC extends CommonGetXController
    with GetTickerProviderStateMixin {
  // --------- 属性 --------- //
  String data = "";
  String? title;
  late AnimationController doubleClickAnimationController;

  // --------- 生命周期  --------- //

  @override
  void onInit() {
    isShowLoadWidget.value = true;
    super.onInit();
  }

  @override
  configDefault() async {
    doubleClickAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    isShowLoadWidget.value = true;
    HzyNormalItemModel itemModel = currentGetArguments();
    title = itemModel.leftMsg;
    data = await rootBundle.loadString("assets/markdown/README.md");
    isShowLoadWidget.value = false;
  }
  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //
  tapImage({required String path}) {
    showDig(
      context: Get.context!,
      widget: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 100,
            bottom: 100,
            child: CommonExtendedImageWidget.configImage(
              assetPath: path,
              doubleClickAnimationController: doubleClickAnimationController,
              isGesture: true,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: CloseButton(
              color: Colors.white,
              onPressed: () {
                currentGoback();
              },
            ),
          )
        ],
      ),
    );
  }
}
