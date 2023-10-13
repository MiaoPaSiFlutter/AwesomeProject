/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 21:06:33
 * @LastEditors: TT
 * @LastEditTime: 2023-09-09 09:04:10
 */

import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:extended_image_library/extended_image_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../config/normal_image_path_config.dart';
import '../models/image_normal_model.dart';

typedef DoubleClickAnimationListener = void Function();

class CommonExtendedImageWidget {
  static const _package = "hzy_common";
  static Widget configImage({
    /// 图片字节流
    Uint8List? bytes,

    /// 图片File
    File? imageFile,

    /// 本地资源文件路径
    String? assetPath,

    /// 网络图片地址
    String? imageUrl,

    /// 是否可以触发点击
    bool isGesture = false,

    /// 点击动画控制器
    AnimationController? doubleClickAnimationController,

    /// hero 动画标识
    String? heroStr,

    /// 图片展示方式
    BoxFit? fit,

    /// 图片宽
    double? width,

    /// 图片高
    double? height,

    /// 边线
    BoxBorder? border,

    /// 圆角
    BorderRadius? borderRadius,

    /// 阴影
    BoxShape? shape,

    /// 是否缓存
    bool cache = true,

    /// 缓存文件名字
    String? cacheName,

    /// 加载动画
    Widget? placeHoldWidget,

    /// 是否显示加载动画
    bool isShowLoadIng = true,

    /// 加载动画圆角
    double? loadRadius,

    /// 缩放尺寸
    Size? size,

    /// 图片模式
    ExtendedImageMode? mode,

    /// 编辑图片 key
    Key? extendedImageEditorKey,

    ///
    bool enableLoadState = false,

    ///
    EditorConfig? editorConfig,

    ///
    BlendMode? colorBlendMode,
  }) {
    Widget child = Container();
    child = LayoutBuilder(
      builder: ((p0, p1) {
        Widget image = Container();
        size ??= Size(p1.maxWidth, p1.maxHeight);

        if (bytes != null) {
          image = memory(
            bytes: bytes,
            isGesture: isGesture,
            doubleClickAnimationController: doubleClickAnimationController,
            fit: fit,
            width: width,
            height: height,
            cache: cache,
            cacheName: cacheName,
            border: border,
            borderRadius: borderRadius,
            shape: shape,
            placeHoldWidget: placeHoldWidget,
            isShowLoadIng: isShowLoadIng,
            loadRadius: loadRadius,
            size: size,
            mode: mode,
            extendedImageEditorKey: extendedImageEditorKey,
            editorConfig: editorConfig,
            enableLoadState: enableLoadState,
            colorBlendMode: colorBlendMode,
          );
        } else if (imageFile != null) {
          image = kIsWeb
              ? Container()
              : fileImage(
                  file: imageFile,
                  isGesture: isGesture,
                  doubleClickAnimationController:
                      doubleClickAnimationController,
                  fit: fit,
                  width: width,
                  height: height,
                  cache: cache,
                  cacheName: cacheName,
                  border: border,
                  borderRadius: borderRadius,
                  shape: shape,
                  placeHoldWidget: placeHoldWidget,
                  isShowLoadIng: isShowLoadIng,
                  loadRadius: loadRadius,
                  size: size,
                  mode: mode,
                  extendedImageEditorKey: extendedImageEditorKey,
                  editorConfig: editorConfig,
                  enableLoadState: enableLoadState,
                  colorBlendMode: colorBlendMode,
                );
        } else if (imageUrl != null) {
          image = netWorkImget(
            url: imageUrl,
            isGesture: isGesture,
            doubleClickAnimationController: doubleClickAnimationController,
            fit: fit,
            width: width,
            height: height,
            cache: cache,
            cacheName: cacheName,
            border: border,
            borderRadius: borderRadius,
            shape: shape,
            placeHoldWidget: placeHoldWidget,
            isShowLoadIng: isShowLoadIng,
            loadRadius: loadRadius,
            size: size,
            mode: mode,
            extendedImageEditorKey: extendedImageEditorKey,
            editorConfig: editorConfig,
            enableLoadState: enableLoadState,
            colorBlendMode: colorBlendMode,
          );
        } else if (assetPath != null) {
          image = assetImage(
            assetPath: assetPath,
            isGesture: isGesture,
            doubleClickAnimationController: doubleClickAnimationController,
            fit: fit,
            width: width,
            height: height,
            cache: cache,
            cacheName: cacheName,
            border: border,
            borderRadius: borderRadius,
            shape: shape,
            placeHoldWidget: placeHoldWidget,
            isShowLoadIng: isShowLoadIng,
            loadRadius: loadRadius,
            size: size,
            mode: mode,
            extendedImageEditorKey: extendedImageEditorKey,
            editorConfig: editorConfig,
            enableLoadState: enableLoadState,
            colorBlendMode: colorBlendMode,
          );
        }
        return image;
      }),
    );

    if (heroStr != null) {
      child = Hero(
        tag: heroStr,
        child: child,
      );
    }
    return child;
  }

  static Widget assetImage({
    required String assetPath,

    /// 是否可以触发点击
    bool isGesture = false,

    /// 点击动画控制器
    AnimationController? doubleClickAnimationController,

    /// hero 动画标识
    String? heroStr,

    /// 图片展示方式
    BoxFit? fit,

    /// 图片宽
    double? width,

    /// 图片高
    double? height,

    /// 边线
    BoxBorder? border,

    /// 圆角
    BorderRadius? borderRadius,

    /// 阴影
    BoxShape? shape,

    /// 是否缓存
    bool cache = true,

    /// 缓存文件名字
    String? cacheName,

    /// 加载动画
    Widget? placeHoldWidget,

    /// 是否显示加载动画
    bool isShowLoadIng = true,

    /// 加载动画圆角
    double? loadRadius,

    /// 缩放尺寸
    Size? size,

    /// 图片模式
    ExtendedImageMode? mode,

    /// 编辑图片 key
    Key? extendedImageEditorKey,

    ///
    bool enableLoadState = false,

    ///
    EditorConfig? editorConfig,

    ///
    BlendMode? colorBlendMode,
  }) =>
      ExtendedImage.asset(
        assetPath,
        mode: isGesture ? ExtendedImageMode.gesture : ExtendedImageMode.none,
        width: width,
        height: height,
        imageCacheName: cacheName,
        border: border,
        shape: borderRadius != null ? BoxShape.rectangle : shape,
        borderRadius: borderRadius,
        loadStateChanged: isGesture
            ? null
            : (state) {
                return configLoadStateChange(
                  state: state,
                  width: width,
                  height: height,
                  widget: placeHoldWidget,
                  fit: fit,
                  isShowLoading: isShowLoadIng,
                  loadradius: loadRadius,
                );
              },
        initGestureConfigHandler: (state) {
          return initGestureConfighandler(
            state: state,
            size: size!,
          );
        },
        onDoubleTap: (state) {
          configDoubleTap(
            state: state,
            size: size!,
            isgesture: isGesture,
            doubleClickAnimationController: doubleClickAnimationController,
          );
        },
        cacheRawData: cache,
        fit: fit,
        colorBlendMode: colorBlendMode,
      );

  /*
    加载字节流图片
  */
  static Widget memory({
    /// 图片字节流
    required Uint8List bytes,

    /// 是否可以触发点击
    bool isGesture = false,

    /// 点击动画控制器
    AnimationController? doubleClickAnimationController,

    /// hero 动画标识
    String? heroStr,

    /// 图片展示方式
    BoxFit? fit,

    /// 图片宽
    double? width,

    /// 图片高
    double? height,

    /// 边线
    BoxBorder? border,

    /// 圆角
    BorderRadius? borderRadius,

    /// 阴影
    BoxShape? shape,

    /// 是否缓存
    bool cache = true,

    /// 缓存文件名字
    String? cacheName,

    /// 加载动画
    Widget? placeHoldWidget,

    /// 是否显示加载动画
    bool isShowLoadIng = true,

    /// 加载动画圆角
    double? loadRadius,

    /// 缩放尺寸
    Size? size,

    /// 图片模式
    ExtendedImageMode? mode,

    /// 编辑图片 key
    Key? extendedImageEditorKey,

    ///
    bool enableLoadState = false,

    ///
    EditorConfig? editorConfig,

    ///
    BlendMode? colorBlendMode,
  }) =>
      ExtendedImage.memory(
        bytes,
        mode: mode ??
            (isGesture ? ExtendedImageMode.gesture : ExtendedImageMode.none),
        width: width,
        border: border,
        borderRadius: borderRadius,
        height: height,
        extendedImageEditorKey: extendedImageEditorKey,
        enableLoadState: enableLoadState,
        initEditorConfigHandler: (state) {
          if (editorConfig != null) {
            return editorConfig;
          }
          return null;
        },
        shape: borderRadius != null ? BoxShape.rectangle : shape,
        loadStateChanged: isGesture
            ? null
            : (state) {
                return configLoadStateChange(
                  state: state,
                  width: width,
                  height: height,
                  widget: placeHoldWidget,
                  fit: fit,
                  isShowLoading: isShowLoadIng,
                  loadradius: loadRadius,
                );
              },
        initGestureConfigHandler: (ExtendedImageState state) {
          return initGestureConfighandler(
            state: state,
            size: size!,
          );
        },
        onDoubleTap: (ExtendedImageGestureState state) {
          configDoubleTap(
            state: state,
            size: size!,
            isgesture: isGesture,
            doubleClickAnimationController: doubleClickAnimationController,
          );
        },
        cacheRawData: cache,
        fit: fit,
        colorBlendMode: colorBlendMode,
      );

  /*
      加载File图片
  */
  static Widget fileImage({
    /// 网络图片地址
    required File file,

    /// 是否可以触发点击
    bool isGesture = false,

    /// 点击动画控制器
    AnimationController? doubleClickAnimationController,

    /// 图片展示方式
    BoxFit? fit,

    /// 图片宽
    double? width,

    /// 图片高
    double? height,

    /// 边线
    BoxBorder? border,

    /// 圆角
    BorderRadius? borderRadius,

    /// 阴影
    BoxShape? shape,

    /// 是否缓存
    bool? cache = true,

    /// 缓存文件名字
    String? cacheName,

    /// 加载动画
    Widget? placeHoldWidget,

    /// 是否显示加载动画
    bool isShowLoadIng = true,

    /// 加载动画圆角
    double? loadRadius,

    /// 缩放尺寸
    Size? size,

    /// 图片模式
    ExtendedImageMode? mode,

    /// 编辑图片 key
    Key? extendedImageEditorKey,

    ///
    bool enableLoadState = false,

    ///
    EditorConfig? editorConfig,

    ///
    BlendMode? colorBlendMode,
  }) =>
      ExtendedImage.file(
        file,
        mode: mode ??
            (isGesture ? ExtendedImageMode.gesture : ExtendedImageMode.none),
        width: width,
        height: height,
        border: border,
        shape: borderRadius != null ? BoxShape.rectangle : shape,
        borderRadius: borderRadius,
        extendedImageEditorKey: extendedImageEditorKey,
        enableLoadState: enableLoadState,
        initEditorConfigHandler: (state) {
          if (editorConfig != null) {
            return editorConfig;
          }
          return null;
        },
        loadStateChanged: isGesture
            ? null
            : (state) {
                return configLoadStateChange(
                  state: state,
                  width: width,
                  height: height,
                  widget: placeHoldWidget,
                  fit: fit,
                  isShowLoading: isShowLoadIng,
                  loadradius: loadRadius,
                );
              },
        initGestureConfigHandler: (ExtendedImageState state) {
          return initGestureConfighandler(
            state: state,
            size: size!,
          );
        },
        onDoubleTap: (ExtendedImageGestureState state) {
          configDoubleTap(
            state: state,
            size: size!,
            isgesture: isGesture,
            doubleClickAnimationController: doubleClickAnimationController,
          );
        },
        cacheRawData: true,
        fit: fit,
        colorBlendMode: colorBlendMode,
      );
  /*
    加载网络图片
  */
  static Widget netWorkImget({
    /// 网络图片地址
    required String url,

    /// 是否可以触发点击
    bool isGesture = false,

    /// 点击动画控制器
    AnimationController? doubleClickAnimationController,

    /// 图片展示方式
    BoxFit? fit,

    /// 图片宽
    double? width,

    /// 图片高
    double? height,

    /// 边线
    BoxBorder? border,

    /// 圆角
    BorderRadius? borderRadius,

    /// 阴影
    BoxShape? shape,

    /// 是否缓存
    bool? cache = true,

    /// 缓存文件名字
    String? cacheName,

    /// 加载动画
    Widget? placeHoldWidget,

    /// 是否显示加载动画
    bool isShowLoadIng = true,

    /// 加载动画圆角
    double? loadRadius,

    /// 缩放尺寸
    Size? size,

    /// 图片模式
    ExtendedImageMode? mode,

    /// 编辑图片 key
    Key? extendedImageEditorKey,

    ///
    bool enableLoadState = false,

    ///
    EditorConfig? editorConfig,

    ///
    BlendMode? colorBlendMode,
  }) =>
      ExtendedImage.network(
        url,
        mode: mode ??
            (isGesture ? ExtendedImageMode.gesture : ExtendedImageMode.none),
        width: width,
        height: height,
        fit: fit,
        cache: cache!,
        border: border,
        imageCacheName: cacheName ?? _package,
        shape: borderRadius != null ? BoxShape.rectangle : shape,
        borderRadius: borderRadius,
        extendedImageEditorKey: extendedImageEditorKey,
        enableLoadState: enableLoadState,
        initEditorConfigHandler: (state) {
          if (editorConfig != null) {
            return editorConfig;
          }
          return null;
        },
        loadStateChanged: isGesture
            ? null
            : (state) {
                return configLoadStateChange(
                  state: state,
                  width: width,
                  height: height,
                  widget: placeHoldWidget,
                  fit: fit,
                  isShowLoading: isShowLoadIng,
                  loadradius: loadRadius,
                );
              },
        initGestureConfigHandler: (state) {
          return initGestureConfighandler(
            state: state,
            size: size!,
          );
        },
        onDoubleTap: (state) {
          configDoubleTap(
            state: state,
            size: size!,
            isgesture: isGesture,
            doubleClickAnimationController: doubleClickAnimationController,
          );
        },
        cacheRawData: cache,
        colorBlendMode: colorBlendMode,
      );

  static double? initScale({
    required Size imageSize,
    required Size size,
    double? initialScale,
  }) {
    final double n1 = imageSize.height / imageSize.width;
    final double n2 = size.height / size.width;
    if (n1 > n2) {
      final FittedSizes fittedSizes =
          applyBoxFit(BoxFit.contain, imageSize, size);
      final Size destinationSize = fittedSizes.destination;
      return size.width / destinationSize.width;
    } else if (n1 / n2 < 1 / 4) {
      final FittedSizes fittedSizes =
          applyBoxFit(BoxFit.contain, imageSize, size);
      final Size destinationSize = fittedSizes.destination;
      return size.height / destinationSize.height;
    }

    return initialScale;
  }

  /// 配置点击事件
  static initGestureConfighandler({
    required ExtendedImageState state,
    required Size size,
  }) {
    double? initialScale = 1.0;
    if (state.extendedImageInfo != null) {
      initialScale = initScale(
        size: size,
        initialScale: initialScale,
        imageSize: Size(
          state.extendedImageInfo!.image.width.toDouble(),
          state.extendedImageInfo!.image.height.toDouble(),
        ),
      );
    }
    return GestureConfig(
      inPageView: true,
      initialScale: initialScale!,
      maxScale: max(initialScale, 5.0),
      animationMaxScale: max(initialScale, 5.0),
      initialAlignment: InitialAlignment.center,
      cacheGesture: false,
    );
  }

  /// 配置双击点击事件
  static configDoubleTap({
    required ExtendedImageGestureState state,
    required Size size,
    bool isgesture = true,
    AnimationController? doubleClickAnimationController,
  }) {
    Animation<double>? doubleClickAnimation;
    late DoubleClickAnimationListener doubleClickAnimationListener;
    List<double> doubleTapScales = <double>[1.0, 2.0];
    if (isgesture && doubleClickAnimationController != null) {
      final Offset? pointerDownPosition = state.pointerDownPosition;
      final double? begin = state.gestureDetails!.totalScale;
      double end;
      doubleClickAnimationController.stop();
      doubleClickAnimationController.reset();
      if (begin == doubleTapScales[0]) {
        end = doubleTapScales[1];
      } else {
        end = doubleTapScales[0];
      }
      doubleClickAnimationListener = () {
        state.handleDoubleTap(
          scale: doubleClickAnimation!.value,
          doubleTapPosition: pointerDownPosition,
        );
      };
      doubleClickAnimation = doubleClickAnimationController.drive(
        Tween<double>(
          begin: begin,
          end: end,
        ),
      );
      doubleClickAnimation.addListener(
        doubleClickAnimationListener,
      );
      doubleClickAnimationController.forward();
    }
  }

  /*
   * 配置图片加载不同状态
   * 显示不同图片 
  */
  static Widget? configLoadStateChange({
    required ExtendedImageState state,
    double? width,
    double? height,
    Widget? widget,
    BoxFit? fit,
    double? loadradius,
    bool isShowLoading = true,
  }) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return widget ??
            (isShowLoading
                ? CupertinoActivityIndicator(
                    animating: true,
                    radius: (loadradius ?? ((width ?? 120) / 10)) < 0
                        ? 10
                        : (loadradius ?? ((width ?? 120) / 10)),
                  )
                : null);
      case LoadState.completed:
        return ExtendedRawImage(
          image: state.extendedImageInfo?.image,
          width: width,
          height: height,
          fit: fit,
        );
      case LoadState.failed:
        return Image(
          image: AssetImage(NormalImagePathConfit.imageFail),
        );
      default:
    }
    return null;
  }
}

// 创建单个图片
Widget createImageBuilder({
  required ImageNormalModel imageNormalModel,
  int? index,
  bool cache = true,
  String? cacheName = "cacheName",
  AnimationController? doubleClickAnimationController,
  bool isGesture = false,
  bool isNeedHero = true,
  bool isCanTap = false,
  BoxFit? boxFit,
  String? heroStr,
  BorderRadius? borderRadius,
  Border? border,
  double? width,
  double? height,
  double? loadradius,
  ExtendedImageMode? mode,
  Key? extendedImageEditorKey,
  bool enableLoadState = false,
  EditorConfig? editorConfig,
  BlendMode? colorBlendMode,
  Function(int)? tapCall,
  Function(int)? onLongPress,
}) {
  Widget child = CommonExtendedImageWidget.configImage(
    heroStr: isNeedHero
        ? (heroStr ?? (imageNormalModel.heroStr ?? "ImageHero$index"))
        : null,
    bytes: imageNormalModel.byte,
    imageFile: imageNormalModel.file,
    imageUrl: imageNormalModel.url,
    cache: cache,
    width: width ?? imageNormalModel.size?.width,
    height: height ?? imageNormalModel.size?.height,
    cacheName: cacheName,
    isGesture: isGesture,
    fit: boxFit,
    mode: mode,
    extendedImageEditorKey: extendedImageEditorKey,
    doubleClickAnimationController: doubleClickAnimationController,
    borderRadius: borderRadius,
    border: border,
    loadRadius: loadradius,
    enableLoadState: enableLoadState,
    editorConfig: editorConfig,
  );

  if (isCanTap) {
    child = GestureDetector(
      onTap: () {
        if (tapCall != null) {
          tapCall(index ?? 0);
        }
      },
      child: child,
      onLongPress: () {
        if (onLongPress != null) {
          onLongPress(index ?? 0);
        }
      },
    );
  }

  return child;
}
