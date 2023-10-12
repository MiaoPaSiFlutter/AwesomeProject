/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-04-09 21:39:53
 * @LastEditors: TT
 * @LastEditTime: 2023-05-04 17:49:04
 */

import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:flutter/material.dart';
import '../compontents/my_banner_widget.dart';
import '../compontents/compontents_index.dart';
import '../compontents/my_top_tool_widget.dart';
import '../config/my_module_image_id_config.dart';
import '../config/my_normal_config.dart';
import '../tools/my_module_image_path_config.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends CommonState<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  bool configSafeAreaTop() => false;
  @override
  bool configIsShowAppBar() => false;

  /// 整体 滚动控制器
  ScrollController scrollController = ScrollController();

  /// 导航栏 滑动进度
  double navProgress = 0;

  /// 界面配置项
  MyNormalConfig get config => MyNormalConfig();

  @override
  void initDefaultState() {
    /// 监听控制器滚动位置
    scrollController.addListener(() {
      double pg = scrollController.offset / 70.h;
      if (pg > 1.0) {
        pg = 1.0;
      } else if (pg < 0) {
        pg = 0;
      }
      setState(() {
        navProgress = pg;
      });
    });
    super.initDefaultState();
  }

  @override
  void initDefaultDispose() {
    scrollController.dispose();
    super.initDefaultDispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createBuild(context: context);
  }

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    Widget body = configCustomScrollView();
    return body;
  }

  /// 创建滚动视图
  configCustomScrollView() {
    Widget body = CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPersistentHeader(
          delegate: MyHeaderSliverDelegate(),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: (70).h,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: HzyCommonColor().backgroudgrey,
              borderRadius: BorderRadius.circular(
                16.r,
              ),
            ),
            child: Column(
              children: [
                MyBannerPage(
                  bannerList: config.bannerList,
                ),
                configNormalItemListWidget(),
                Gaps.vGap20,
              ],
            ),
          ),
        ),
      ],
    );

    body = SizedBox.expand(
      child: body,
    );
    body = Stack(
      children: [
        configImageBg(),
        configToolWidget(),
        body,
      ],
    );

    return body;
  }

  /// 创建背景图
  configImageBg() {
    /// 获取滚动图片大小
    double userImgW =
        Tween<double>(begin: 60.h + 70.h, end: 0).transform(navProgress);
    Widget body = Image.asset(
      MyModuleImagePathConfig().configImagePath(
        pathkey: MyModuleImageIdConfig.myHeaderImg,
      ),
      fit: BoxFit.fill,
      height: SizeMacro.navh + userImgW,
      width: SizeMacro.screenWidth,
    );

    return body;
  }

  /// 创建工具栏
  configToolWidget() {
    double userImgW = Tween<double>(begin: 70.h, end: 20.h).transform(
      navProgress,
    );
    Widget body = MyTopToollessV();
    body = Positioned(
      left: 15.w,
      right: 15.w,
      top: SizeMacro.navh + userImgW,
      child: body,
    );
    return body;
  }

  /// 创建通用入口item

  configNormalItemListWidget() {
    Widget body = Column(
      children: [
        ...List.generate(
          config.myItemList.length,
          (index) {
            HzyNormalItemModel itemModel = config.myItemList[index];
            if (itemModel.isHintWidget != true) {
              itemModel.height = 60.h;
            }
            Widget body = configNormalDarkItemWidget(itemModel: itemModel);
            return body;
          },
        )
      ],
    );

    // body = Container(
    //   margin: EdgeInsets.symmetric(
    //     horizontal: 15.w,
    //   ),
    //   child: body,
    // );
    return body;
  }

  @override
  configBoxDecoreation() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          HzyCommonColor().backgroudgrey,
          HzyCommonColor().backgroudgrey,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [
          0.2,
          0.4,
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  ///
  configTapItem({required HzyNormalItemModel model}) {
    if (model.tapType == 1 && model.router != null) {
      currentToPage(model.router!);
    }
  }
}
