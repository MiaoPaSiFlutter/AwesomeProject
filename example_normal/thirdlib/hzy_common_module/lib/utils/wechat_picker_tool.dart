/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-05 09:42:32
 * @LastEditors: TT
 * @LastEditTime: 2023-05-29 17:35:36
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/utils/picker_tool.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../config/hzy_common_color_config.dart';
import 'utils.dart';

class WechatPickerConfig {
  RequestType requestType = RequestType.image;
  AssetPickerConfig? pickerConfig;
  CameraPickerConfig cameraConfig = const CameraPickerConfig();
  Color? themeColor;
}

class WechatPickerTool {
  /*
   * 配置相册相机功能
   * selectedAssets 选择的图片
   * maxAssets 最多个数
   * requestType: 相册支持的样式 图片 视频
   * pickerConfig 相册配置文件
   * cameraConfig 相机配置文件
   * type: 0 相册 1 相机
   * */
  static configWechatPickerTool({
    required BuildContext context,
    List<AssetEntity>? selectedAssets,
    int maxAssets = 1,
    Function(List<AssetEntity>? list)? onChange,
    RequestType requestType = RequestType.image,
    AssetPickerConfig? pickerConfig,
    CameraPickerConfig cameraConfig = const CameraPickerConfig(),
    Color? themeColor,
    int type = 0,
  }) {
    PickerTool.configImagePickerPermission(
      context: context,
      onSuccess: () async {
        List<AssetEntity>? list;
        loadDismiss();
        if (type == 0) {
          list = await configGallery(
            context: context,
            selectedAssets: selectedAssets,
            maxAssets: maxAssets,
            requestType: requestType,
            themeColor: themeColor,
            pickerConfig: pickerConfig,
          );
        } else if (type == 1) {
          list = await configCamera(
            context: context,
            pickerConfig: cameraConfig,
          );
        }
        if (onChange != null) {
          onChange(list);
        }
      },
    );
  }

  /// 相册
  static configGallery({
    required BuildContext context,
    List<AssetEntity>? selectedAssets,
    int maxAssets = 1,
    RequestType requestType = RequestType.image,
    Color? themeColor,
    AssetPickerConfig? pickerConfig,
  }) async {
    return await AssetPicker.pickAssets(
      context,
      pickerConfig: pickerConfig ??
          AssetPickerConfig(
            maxAssets: maxAssets,
            selectedAssets: selectedAssets,
            requestType: requestType,
            themeColor: themeColor ?? HzyCommonColor().colthemes,
          ),
    );
  }

  /// 相机
  static configCamera({
    required BuildContext context,
    CameraPickerConfig pickerConfig = const CameraPickerConfig(),
  }) async {
    return await CameraPicker.pickFromCamera(
      context,
      pickerConfig: pickerConfig,
    );
  }
}
