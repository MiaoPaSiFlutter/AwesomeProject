/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-06-06 11:28:28
 * @LastEditors: TT
 * @LastEditTime: 2023-09-01 11:29:46
 */

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../models/models_index.dart';
import 'picker_tool.dart';
import 'utils.dart';

class SavePhotoTool {
  /// 保存单张图片到相册
  static saveOneImgToPhotos({
    required ImageNormalModel imageNormalModel,
  }) async {
    final String title = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    Uint8List? bytes =
        await configImageDataWithBytes(imageNormalModel: imageNormalModel);
    if (bytes != null) {
      final AssetEntity? imageEntity = await PhotoManager.editor.saveImage(
        bytes,
        title: title,
      );
      return imageNormalModel.assetPath != null || imageEntity != null;
    } else {
      return false;
    }
  }

  /// 仅仅存图片
  static onlySaveImgSToPhotos({
    required List<ImageNormalModel> list,
    Function(int index, int allNum)? onProgress,
    Function()? onSuccess,
    Function()? onFail,
    Function(List<ImageNormalModel>)? saveFailImgS,
  }) async {
    int num = 0;
    int successNum = 0;
    List<ImageNormalModel> saveFailList = [];
    for (var element in list) {
      num = num + 1;
      var res = await saveOneImgToPhotos(imageNormalModel: element);
      if (onProgress != null) {
        onProgress(num, list.length);
      }
      if (res) {
        successNum = successNum + 1;
      } else {
        saveFailList.add(element);
      }
    }
    if (successNum == list.length) {
      if (onSuccess != null) {
        onSuccess();
      }
    } else if (successNum == 1 && list.length != 1) {
      if (onFail != null) {
        onFail();
      }
    } else {
      if (saveFailImgS != null) {
        saveFailImgS(saveFailList);
      }
    }
  }

  /// 保存多张图片到相册
  /// 带权限判断
  static saveImgToPhotos({
    required BuildContext context,
    required List<ImageNormalModel> list,
    bool isShowPop = true,
    Function(int index, int allNum)? onProgress,
    Function()? onSuccess,
    Function()? onFail,
    Function(List<ImageNormalModel>)? saveFailImgS,
    PerCallback? onPerFail,
  }) async {
    PickerTool.configAtlasPermission(
      context: context,
      isShowPop: isShowPop,
      onPerCallback: (perList) async {
        if (isShowPop == false && perList.isNotEmpty) {
          if (onPerFail != null) {
            onPerFail(perList);
          }
        } else {
          onlySaveImgSToPhotos(
            list: list,
            onFail: onFail,
            onProgress: onProgress,
            onSuccess: onSuccess,
            saveFailImgS: saveFailImgS,
          );
        }
      },
    );
  }
}
