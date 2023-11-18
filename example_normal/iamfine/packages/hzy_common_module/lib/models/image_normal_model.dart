/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-07-10 16:31:39
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:32:20
 */

import 'dart:typed_data';

import 'package:extended_image_library/extended_image_library.dart';
import 'package:flutter/material.dart';

class ImageNormalModel {
  ImageNormalModel({
    this.size,
    this.byte,
    this.url,
    this.file,
    this.assetPath,
    this.heroStr,
  });

  /// 图片尺寸
  Size? size;

  /// 图片file
  File? file;

  /// 图片字节
  Uint8List? byte;

  /// 图片资源地址
  String? assetPath;

  /// 图片网络url
  String? url;

  /// hero tag
  String? heroStr;

  /// 图片标识位
  String? subScriptStr;
}
