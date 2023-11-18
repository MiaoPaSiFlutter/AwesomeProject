/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-26 15:17:46
 * @LastEditors: TT
 * @LastEditTime: 2023-05-08 12:12:09
 */

import 'package:extended_image_library/extended_image_library.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hzy_common_module/hzy_common_module.dart';

import 'package:reorderables/reorderables.dart';

enum GridImageType {
  file,
  assent,
  network,
  bytes,
}

class GridImageModel {
  /// 加载图片类型
  GridImageType? type;

  /// 0 图片 1 自定义widget
  int? widgetType;

  /// file
  File? file;

  /// 网络图片
  String? netImageUrl;

  /// 资源文件
  String? assetPath;

  /// 图片字节
  Uint8List? bytes;

  bool? isSelect;
  GridImageModel({
    this.type,
    this.file,
    this.bytes,
    this.widgetType = 0,
    this.netImageUrl,
    this.isSelect = false,
  });
}

class CommonGirdImageV extends CommonLessV {
  /// 获取控制器
  final CommonGirdImageC controller = Get.put(CommonGirdImageC());

  /// 图片最多选择个数
  final int? maxAssets;

  /// 当前选择图片回调
  final Function(List?, List<Uint8List>?)? onChange;

  /// 点击item 回调
  final Function(int index)? onTapItem;

  /// 相册 支持的类型 图片 视频
  final RequestType? requestType;

  /// 相册配置文件
  final AssetPickerConfig? pickerConfig;

  /// 相机配置文件
  final CameraPickerConfig? cameraConfig;

  final SliverGridDelegate? gridDelegate;

  /// 横轴方向 个数
  final int? crossAxisCount;

  /// 竖轴方向 间距
  final double? mainAxisSpacing;

  /// 横轴方向 间距
  final double? crossAxisSpacing;

  /// 横轴方向最小个数
  final double? mainAxisExtent;

  /// 相册 相机 主题是
  final Color? themeColor;

  /// 九宫格 item
  final List<Widget>? children;

  CommonGirdImageV({
    super.key,
    this.maxAssets,
    this.onChange,
    this.requestType,
    this.pickerConfig,
    this.cameraConfig,
    this.themeColor,
    this.gridDelegate,
    this.crossAxisCount = 3,
    this.mainAxisSpacing = 10,
    this.crossAxisSpacing = 10,
    this.mainAxisExtent,
    this.onTapItem,
    this.children,
  });

  @override
  bool get isNeedScaffol => false;

  @override
  Widget createScallBody(
      {required BuildContext context, BoxConstraints? constraints}) {
    controller.cameraConfig = cameraConfig ?? const CameraPickerConfig();
    controller.maxAssets = maxAssets ?? 9;
    controller.onChange = onChange;
    controller.requestType = requestType ?? RequestType.image;
    controller.pickerConfig = pickerConfig;
    controller.themeColor = themeColor;

    double? sizeW = constraints == null
        ? null
        : (constraints.maxWidth - crossAxisSpacing! * (crossAxisCount! - 1)) /
            crossAxisCount!;
    Widget body = configReorderableWrap(
      sizeW: sizeW,
    );
    return body;
  }

  @override
  bool configIsNeedLayout() {
    return true;
  }

  @override
  configBoxDecoreation() {
    return null;
  }

  /// 创建可移动
  configReorderableWrap({
    double? sizeW,
  }) {
    Widget body = GetBuilder<CommonGirdImageC>(
      builder: (controller) {
        List<Widget> list = List.generate(
          controller.itmeList.length,
          (index) => configItemWidget(
            index: index,
            commonGirdImageC: controller,
            sizeW: sizeW,
          ),
        );

        Widget bt = ReorderableWrap(
          spacing: crossAxisSpacing!,
          runSpacing: mainAxisSpacing!,
          minMainAxisCount: crossAxisCount,
          onReorder: (oldIndex, newIndex) {
            dPrint("onReorder");
            controller.configReorder(
              oldIndex: oldIndex,
              newIndex: newIndex,
            );
          },
          buildDraggableFeedback: (context, constraints, child) {
            return Transform.scale(
              scale: 1.05,
              child: Material(
                elevation: 6.0,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: ConstrainedBox(
                    constraints: constraints,
                    child: child,
                  ),
                ),
              ),
            );
          },
          onNoReorder: (int index) {
            debugPrint(
                '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
          },
          onReorderStarted: (int index) {
            controller.configStar();
            debugPrint(
                '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
          },
          footer: configAddImageItemWidget(
            sizeW: sizeW,
          ),
          children: list,
        );
        return bt;
      },
    );
    return body;
  }

  /// 创建item
  Widget configItemWidget({
    required int index,
    CommonGirdImageC? commonGirdImageC,
    double? sizeW,
  }) {
    GridImageModel imageModel = controller.itmeList[index];
    Widget body = imageModel.widgetType == 1
        ? configAddImageItemWidget()
        : configNormalImageWidget(
            gridImageModel: imageModel,
            index: index,
            commonGirdImageC: commonGirdImageC,
            sizeW: sizeW,
          );
    body = InkWell(
      onTap: () {
        if (onTapItem != null) {
          onTapItem!(index);
        }
      },
      child: body,
    );
    return body;
  }

  /// 创建图片item
  configNormalImageWidget({
    required GridImageModel gridImageModel,
    required int index,
    CommonGirdImageC? commonGirdImageC,
    double? sizeW,
  }) {
    Widget body = CommonExtendedImageWidget.configImage(
      imageFile: gridImageModel.file,
      imageUrl: gridImageModel.netImageUrl,
      assetPath: gridImageModel.assetPath,
      bytes: gridImageModel.bytes,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(
        12.r,
      ),
    );

    body = configNormalItemBgWidget(
      body: body,
      sizeW: sizeW,
    );
    body = controller.isShowDelectBtn
        ? Stack(
            children: [
              body,
              Container(
                width: sizeW,
                height: sizeW,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(
                    0.2,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              configItemCloseWidget(
                index: index,
              ),
            ],
          )
        : body;
    return body;
  }

  /// 创建关闭按钮
  configItemCloseWidget({
    required int index,
  }) {
    Widget body = const Icon(
      Icons.close,
      size: 20,
      color: Colors.white,
    );

    body = InkWell(
      onTap: () {
        controller.confitTapDelectImage(
          index: index,
        );
      },
      child: body,
    );

    body = Positioned(
      right: 5,
      top: 5,
      child: body,
    );

    return body;
  }

  /// 创建添加图片item
  configAddImageItemWidget({double? sizeW}) {
    Widget body = Icon(
      Icons.add,
      size: 40,
      color: getColorFromHex("#C9CED4"),
    );
    body = configNormalItemBgWidget(
      body: body,
      sizeW: sizeW,
    );
    body = InkWell(
      onTap: () {
        controller.tapAddImage();
      },
      child: body,
    );
    return body;
  }

  /// 创建默认 item 背景
  configNormalItemBgWidget({
    required Widget body,
    double? sizeW,
  }) {
    body = Container(
      width: sizeW,
      height: sizeW,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: getColorFromHex("#F2F6FB"),
      ),
      child: body,
    );

    body = ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: body,
    );
    return body;
  }
}

class CommonGirdImageC extends CommonGetXController
    with GetSingleTickerProviderStateMixin {
  // --------- 私有属性  --------- //

  // --------- 公开属性  --------- //

  /// 图片最多选择个数
  int maxAssets = 9;

  /// 当前选择图片回调
  Function(List?, List<Uint8List>?)? onChange;

  /// 相册 支持的类型 图片 视频
  RequestType requestType = RequestType.image;

  /// 相册配置文件
  AssetPickerConfig? pickerConfig;

  /// 相机配置文件
  CameraPickerConfig cameraConfig = const CameraPickerConfig();

  /// 相册 相机 主题是
  Color? themeColor;

  /// 选择的图片
  List imageList = [];

  /// 选择图片字节
  List<Uint8List> selectImageBtList = [];

  /// 是否显示动画
  bool isShowAnimation = false;

  List itmeList = [];

  List<Widget> list = [];

  /// 是否显示 删除按钮
  bool isShowDelectBtn = false;

  // --------- 生命周期  --------- //

  // --------- 数据处理  --------- //

  // --------- 触发事件  --------- //

  configReorder({
    required int oldIndex,
    required int newIndex,
  }) {
    GridImageModel imageModel = itmeList.removeAt(oldIndex);
    itmeList.insert(newIndex, imageModel);
    update();
  }

  /// 点击添加图片
  tapAddImage() {
    isShowDelectBtn = false;
    update();
    if (kIsWeb) {
      PickerTool.showBottomSheetImagePickerTool(
        context: Get.context!,
        isMult: true,
        onChange: (list) {
          if (list != null) {
            configNormalSelectImage(list: list);
          }
        },
      );
    } else {
      PickerTool.showBottomSheetWechatPickerTool(
        context: Get.context!,
        selectedAssets: imageList,
        maxAssets: maxAssets,
        cameraConfig: cameraConfig,
        pickerConfig: pickerConfig,
        requestType: requestType,
        themeColor: themeColor,
        onChange: (list) {
          if (list != null) {
            configNormalSelectImage(list: list);
          }
        },
      );
    }
  }

  configNormalSelectImage({required List list}) async {
    if (imageList == list) {
      return;
    }
    List cList;
    if (!kIsWeb) {
      cList = list;
    } else {
      /// web 图片去重
      List<XFile> xlist = imageList
          .map(
            (e) => e as XFile,
          )
          .toList();
      xlist.addAll(list as List<XFile>);
      final name = xlist.map((e) => e.name).toSet();
      xlist.retainWhere((element) => name.remove(element.name));
      if (xlist.length == imageList.length) {
        int al = 0;
        for (var i = 0; i < xlist.length; i++) {
          XFile xf = xlist[i];
          XFile imgf = imageList[i];
          if (xf.name == imgf.name) {
            al = al + 1;
          }
        }

        /// 当选择的图片和现有的一样，不做更新操作
        if (al == xlist.length) {
          return;
        }
      }
      cList = xlist;
    }
    itmeList.clear();
    imageList.clear();
    imageList.addAll(cList);
    for (var itme in imageList) {
      Uint8List? thumbtyes;
      if (kIsWeb) {
        XFile xFile = itme as XFile;
        thumbtyes = await xFile.readAsBytes();
      } else {
        AssetEntity assetEntity = itme as AssetEntity;
        thumbtyes = await assetEntity.thumbnailData;
        Uint8List? orginBt = await assetEntity.originBytes;
        selectImageBtList.add(orginBt ?? Uint8List(0));
      }
      itmeList.add(
        GridImageModel(type: GridImageType.bytes, bytes: thumbtyes),
      );
    }
    configSelectImageCallBack();
    Future.delayed(const Duration(milliseconds: 100)).then((value) => update());
  }

  /// 配置图片选择结果回调
  configSelectImageCallBack() {
    if (onChange != null) {
      onChange!(imageList, selectImageBtList);
    }
  }

  /// 配置点击开始事件
  configStar() {
    isShowDelectBtn = true;
    update();
  }

  /// 配置点击删除事件
  confitTapDelectImage({
    required int index,
  }) {
    imageList.removeAt(index);
    itmeList.removeAt(index);
    update();
  }

  /// 配置点击结束事件
  configStop() {}
}
