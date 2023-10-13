/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-05 09:45:00
 * @LastEditors: TT
 * @LastEditTime: 2023-09-08 11:18:09
 */

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'package:hzy_normal_tool/hzy_normal_tool.dart';

import 'image_picker_tool.dart';
import 'permission_helper.dart';
import 'utils.dart';
import 'wechat_picker_tool.dart';

import 'getx_util_tool.dart';

/// 通用权限回调
typedef PerCallback = void Function(List<Permission> perList);
typedef SelectImgCallback = void Function(List? imageList);

class PickerTool {
  /*
   * 显示仿微信相册相机功能
   * selectedAssets 选择的图片
   * maxAssets 最多个数
   * requestType: 相册支持的样式 图片 视频
   * pickerConfig 相册配置文件
   * cameraConfig 相机配置文件
   * type: 0 相册 1 相机
   * themeColor 主题色
   * */
  static showBottomSheetWechatPickerTool({
    required BuildContext context,
    List? selectedAssets,
    int maxAssets = 1,
    Function(List<AssetEntity>? list)? onChange,
    RequestType requestType = RequestType.image,
    AssetPickerConfig? pickerConfig,
    CameraPickerConfig cameraConfig = const CameraPickerConfig(),
    Color? themeColor,
  }) {
    List<AssetEntity>? list;
    if (selectedAssets != null && selectedAssets.isNotEmpty) {
      list = selectedAssets.map((e) => e as AssetEntity).toList();
    }
    configShowBottomSheet(
      context: context,
      child: HzyPopSelectImageWidget(
        tapCall: (index) async {
          currentGoback();
          WechatPickerTool.configWechatPickerTool(
            context: context,
            selectedAssets: list,
            maxAssets: maxAssets,
            requestType: requestType,
            pickerConfig: pickerConfig,
            cameraConfig: cameraConfig,
            themeColor: themeColor,
            type: index,
            onChange: onChange,
          );
        },
      ),
    );
  }

  /*
   * 显示官方相册相机功能
   * ImagePicker 选择器
   * isMult 只针对相册生效，是否可以多选 
   * maxWidth: 图片最大宽度
   * maxHeigh: 图片最大高度
   * imageQuality 图像质量 0～1
   * preferredCameraDevice: 摄像头  rear：后置 front：前置 
   * requestFullMetadata： 是否使用原图 默认true
   * type: 0 相册 1 相机
   * */
  static showBottomSheetImagePickerTool({
    required BuildContext context,
    ImagePicker? imagePicker,
    bool isMult = false,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
    Function(List<XFile>? list)? onChange,
  }) {
    ImagePickerTool.configImagePickerTool(
      context: context,
      imagePicker: imagePicker,
      isMult: isMult,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      type: 0,
      preferredCameraDevice: preferredCameraDevice,
      requestFullMetadata: requestFullMetadata,
      onChange: onChange,
    );

    // configShowBottomSheet(
    //   context: context,
    //   child: HzyPopSelectImageWidget(
    //     tapCall: (index) async {
    //       currentGoback();
    //       ImagePickerTool.configImagePickerTool(
    //         context: context,
    //         imagePicker: imagePicker,
    //         isMult: isMult,
    //         maxHeight: maxHeight,
    //         maxWidth: maxWidth,
    //         type: index,
    //         preferredCameraDevice: preferredCameraDevice,
    //         requestFullMetadata: requestFullMetadata,
    //         onChange: onChange,
    //       );
    //     },
    //   ),
    // );
  }

  /*
   * @description: 权限未开通 , 弹框提示,跳转设置界面
   * @param {*}
   * @return {*}
   */
  static permissionpopupWidget(
      {required BuildContext context, required int status}) {
    loadDismiss();
    String msg = "需要打开相册权限才能加载相册哦~";
    if (status == 1) {
      msg = "需要打开相机权限才能拍照哦~";
    }
    showPopDiaLogWidget(
      context: context,
      msg: msg,
      tapSure: () {
        currentGoback();
        openAppSettings();
      },
    );
  }

  /*
   * 显示 相册相机功能
   *  带权限申请功能
   * pickType: 0 wechat风格 系统默认
   * selectedAssets: 选择的图片
   * maxAssets: 最多个数
   * wechatPickerConfig: wechat 风格配置文件
   * imagePickerConfig: 系统相册配置文件
   * type: 0 相册 1 相机
   * isShowPop: true 默认弹出 权限失败弹框
   * onPerFail: 权限授权失败回调
   * */
  static configPickToolHavePerWithAtlas({
    required BuildContext context,
    int pickType = 0,
    List? selectedAssets,
    int maxAssets = 1,
    WechatPickerConfig? wechatPickerConfig,
    ImagePickerConfig? imagePickerConfig,
    int type = 0,
    bool isShowPop = true,
    PerCallback? onPerFail,
    SelectImgCallback? callback,
  }) async {
    configAtlasPermission(
      type: type,
      isShowPop: isShowPop,
      context: context,
      onPerCallback: (perList) async {
        if (isShowPop == false && perList.isNotEmpty) {
          if (onPerFail != null) {
            onPerFail(perList);
          }
        } else {
          List? list = await configPickToolWithAtlas(
            context: context,
            pickType: pickType,
            selectedAssets: selectedAssets,
            maxAssets: maxAssets,
            wechatPickerConfig: wechatPickerConfig,
            imagePickerConfig: imagePickerConfig,
            type: type,
          );
          if (callback != null) {
            callback(list);
          }
        }
      },
    );
  }

  /*
   * 显示 相册相机功能
   * 不带权限申请功能
   * pickType  0 wechat风格 系统默认
   * selectedAssets 选择的图片
   * maxAssets 最多个数
   * wechatPickerConfig wechat 风格配置文件
   * imagePickerConfig 系统相册配置文件
   * type: 0 相册 1 相机
   * */
  static configPickToolWithAtlas({
    required BuildContext context,
    int pickType = 0,
    List? selectedAssets,
    int maxAssets = 1,
    WechatPickerConfig? wechatPickerConfig,
    ImagePickerConfig? imagePickerConfig,
    SelectImgCallback? callback,
    int type = 0,
  }) async {
    if (pickType == 0) {
      List<AssetEntity>? list;
      if (selectedAssets != null && selectedAssets.isNotEmpty) {
        list = selectedAssets.map((e) => e as AssetEntity).toList();
      }
      wechatPickerConfig ??= WechatPickerConfig();
      list = await WechatPickerTool.configWechatPickerTool(
        context: context,
        selectedAssets: list,
        maxAssets: maxAssets,
        requestType: wechatPickerConfig.requestType,
        pickerConfig: wechatPickerConfig.pickerConfig,
        cameraConfig: wechatPickerConfig.cameraConfig,
        themeColor: wechatPickerConfig.themeColor,
        type: type,
      );
      if (callback != null) {
        callback(list);
      } else {
        return list;
      }
    } else {
      imagePickerConfig ??= ImagePickerConfig();
      List<XFile>? selectImage;
      selectImage = await ImagePickerTool.configImagePickerTool(
        context: context,
        imagePicker: imagePickerConfig.imagePicker,
        isMult: maxAssets >= 1,
        maxHeight: imagePickerConfig.maxHeight,
        maxWidth: imagePickerConfig.maxWidth,
        type: type,
        preferredCameraDevice: imagePickerConfig.preferredCameraDevice,
        requestFullMetadata: imagePickerConfig.requestFullMetadata,
      );
      if (callback != null) {
        callback(selectImage);
      } else {
        return selectImage;
      }
    }
  }

  /*
   * @description: 配置相册，相机权限
   * @param {
   *     type 权限区分 
   *          0 相册
   *          1 相机
   * }
   * @return { 
   *      true  代表 权限通过*-+ 
   *      false 代表 权限未通过
   * }
   */
  static Future<List<Permission>> configAtlasPermission({
    int type = 0,
    bool isShowPop = true,
    BuildContext? context,
    PerCallback? onPerCallback,
  }) async {
    List<Permission> list = [];
    if (kIsWeb) {
      if (onPerCallback != null) {
        onPerCallback(list);
      }
      return list;
    }
    Permission permission;
    if (type == 0) {
      if (Platform.isIOS) {
        permission = Permission.photosAddOnly;
      } else {
        permission = Permission.storage;
      }
    } else {
      permission = Permission.camera;
    }
    list = await PermissionHelper.checkPermission(
      permissionList: [permission],
    );

    if (list.isEmpty && isShowPop && context != null) {
      PermissionHelper.permissionPopUpWidget(
        permission: permission,
      );
    }
    if (onPerCallback != null) {
      onPerCallback(list);
    }
    return list;
  }

  /// 配置相册和相机权限
  /// 备注说明： 此方法在2.0版本将会废弃
  static configImagePickerPermission({
    required BuildContext context,
    int status = 0,
    Function()? onSuccess,
    dynamic Function(Permission?)? onFailed,
  }) {
    if (kIsWeb) {
      if (onSuccess != null) {
        onSuccess();
      }
      return;
    }
    Permission permission;
    if (status == 0) {
      if (Platform.isIOS) {
        permission = Permission.photosAddOnly;
      } else {
        permission = Permission.storage;
      }
    } else {
      permission = Permission.camera;
    }
    showLoad();
    PermissionHelper.check(
      [permission],
      onSuccess: () async {
        if (onSuccess != null) {
          onSuccess();
        }
      },
      onFailed: (per) {
        if (onFailed != null) {
          onFailed(per);
        } else {
          PermissionHelper.permissionPopUpWidget(
            permission: permission,
          );
        }
      },
      onOpenSetting: (per) {
        if (onFailed != null) {
          onFailed(per);
        } else {
          PermissionHelper.permissionPopUpWidget(
            permission: permission,
          );
        }
      },
    );
  }
}
