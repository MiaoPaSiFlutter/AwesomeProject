import 'dart:typed_data';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../components/common_extendeed_image_widget.dart';
import '../components/common_widgets.dart';
import '../models/image_normal_model.dart';
import 'screenutil_tools.dart';

class NormalModuleUtils {
  /// 用于加载 package 模块图片
  static configPackagesImage(
      {required String packagename, required String name}) {
    return "packages/$packagename/$name";
  }

  static normalModuleImagePath({required String name}) {
    return configPackagesImage(
      packagename: package,
      name: name,
    );
  }

  static ImageProvider getAssetImage(String assetName) {
    return AssetImage(assetName);
  }

  static const package = "hzy_common_module";
}

/// 通过图片信息
/// 获取图片字节
Future<Uint8List?> configImageDataWithBytes({
  required ImageNormalModel imageNormalModel,
}) async {
  Uint8List? bytes;
  if (imageNormalModel.byte != null) {
    bytes = imageNormalModel.byte;
  } else if (imageNormalModel.url != null) {
    bytes = await getNetworkImageData(
      imageNormalModel.url!,
    );
  } else if (imageNormalModel.file != null) {
    bytes = await imageNormalModel.file!.readAsBytes();
  } else if (imageNormalModel.assetPath != null) {
    ByteData byteData = await rootBundle.load(imageNormalModel.assetPath!);
    bytes = byteData.buffer.asUint8List();
  }
  return bytes;
}

/// 配置结束刷新
configEndRefresh({
  int? type,
  PageState? state,
  EasyRefreshController? refreshController,
}) {
  IndicatorResult result = IndicatorResult.success;

  if (state == PageState.errorState ||
      state == PageState.erroronlyTotal ||
      state == PageState.errorshowRelesh) {
    result = IndicatorResult.fail;
  } else if (state == PageState.noMoreDataState && type == 2) {
    result = IndicatorResult.noMore;
  }
  if (refreshController != null) {
    if (type == 1) {
      refreshController.finishRefresh(result);
    } else if (type == 2) {
      refreshController.finishLoad(result);
    }
  }
  return state;
}

/// 加载网络图片
Widget conFigNetWorkImage({
  String? url,
  Uint8List? bytes,
  String? assetPath,
  double? width,
  double? height,
  BorderRadius? borderRadius = BorderRadius.zero,
  String? placeholder,
  double? loadradius,
  BoxFit fit = BoxFit.fill,
  String? heroStr,
}) {
  return CommonExtendedImageWidget.configImage(
    imageUrl: url,
    bytes: bytes,
    assetPath: assetPath,
    width: width,
    height: height,
    borderRadius: borderRadius,
    fit: fit,
    loadRadius: loadradius,
    heroStr: heroStr,
  );
}

// 展示默认加载动画
void showLoad({String? msg}) {
  EasyLoading.instance.backgroundColor = Colors.white.withOpacity(0);
  EasyLoading.instance.maskColor = Colors.white.withOpacity(0);
  EasyLoading.instance.indicatorColor = Colors.white.withOpacity(0);
  EasyLoading.instance.textColor = Colors.white.withOpacity(1);
  EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
  EasyLoading.instance.radius = 12;
  EasyLoading.instance.contentPadding = EdgeInsets.symmetric(
    vertical: 15.0,
    horizontal: msg == null ? 20 : 30.0,
  );
  EasyLoading.instance.textPadding = EdgeInsets.zero;
  EasyLoading.instance.boxShadow = [
    BoxShadow(
      color: HzyNormalColorS.col000000.withOpacity(0),
    )
  ];
  EasyLoading.show(
    indicator: configLoadWidget(),
    maskType: EasyLoadingMaskType.custom,
    dismissOnTap: true,
    status: msg,
  );
}

/// 显示toast msg
/// 传content 后,如果没传ontap 会调用返回上一个界面的方法
/// type == 1 普通 toast , 2 成功toast 3 失败toast
void showToastMsg(
  String msg, {
  int type = 1,
  EasyLoadingStyle loadingStyle = EasyLoadingStyle.dark,
  BuildContext? context,
  Function()? onTap,
}) {
  EasyLoading.instance.loadingStyle = loadingStyle;
  if (type == 1) {
    EasyLoading.showToast(msg);
  } else if (type == 2) {
    EasyLoading.showSuccess(msg);
  } else if (type == 3) {
    EasyLoading.showError(msg);
  }
  if (onTap != null || context != null) {
    Future.delayed(EasyLoading.instance.displayDuration).then((value) {
      if (onTap != null) {
        onTap();
      } else {
        Navigator.of(context!).pop();
      }
    });
  }
}

void showNormalLoadMsg({
  String? msg,
  EasyLoadingStyle loadingStyle = EasyLoadingStyle.dark,
}) {
  EasyLoading.instance.loadingStyle = loadingStyle;
  EasyLoading.show(status: msg);
}

// 取消加载动画
void loadDismiss() {
  EasyLoading.dismiss();
}

/// 配置通用底部安全区域
configSafeBottomHeight() {
  return SizeMacro.bottomBarHeight == 0 ? 10.0 : SizeMacro.bottomBarHeight;
}
