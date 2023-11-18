/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-26 16:25:00
 * @LastEditors: TT
 * @LastEditTime: 2023-05-05 12:34:01
 */

import 'package:flutter/material.dart';
import 'package:hzy_common_module/utils/picker_tool.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerConfig {
  ImagePicker? imagePicker;
  bool isMult = false;
  double? maxWidth;
  double? maxHeight;
  int? imageQuality;
  CameraDevice preferredCameraDevice = CameraDevice.rear;
  bool requestFullMetadata = true;
}

class ImagePickerTool {
  static configImagePickerTool({
    required BuildContext context,
    ImagePicker? imagePicker,
    bool isMult = false,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
    Function(List<XFile>? list)? onChange,
    int type = 0,
  }) async {
    PickerTool.configImagePickerPermission(
      context: context,
      onSuccess: () async {
        List<XFile>? selectImage;
        if (type == 0) {
          selectImage = await configGallery(
            imagePicker: imagePicker,
            isMult: isMult,
            maxHeight: maxHeight,
            maxWidth: maxWidth,
            imageQuality: imageQuality,
            preferredCameraDevice: preferredCameraDevice,
            requestFullMetadata: requestFullMetadata,
          );
        } else {
          selectImage = await configCamera(
            imagePicker: imagePicker,
            maxHeight: maxHeight,
            maxWidth: maxWidth,
            preferredCameraDevice: preferredCameraDevice,
            requestFullMetadata: requestFullMetadata,
          );
        }
        if (onChange != null) {
          onChange(selectImage);
        }
      },
    );
  }

  /// 相册
  static configGallery({
    ImagePicker? imagePicker,
    bool isMult = false,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
  }) async {
    imagePicker ??= ImagePicker();
    List<XFile>? selectImage;
    if (isMult) {
      selectImage = await imagePicker.pickMultiImage(
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
        requestFullMetadata: requestFullMetadata,
      );
    } else {
      XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
        preferredCameraDevice: preferredCameraDevice,
        requestFullMetadata: requestFullMetadata,
      );
      if (image != null) {
        selectImage = [image];
      }
    }
    return selectImage;
  }

  /// 相机
  static configCamera({
    ImagePicker? imagePicker,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
    bool requestFullMetadata = true,
  }) async {
    imagePicker ??= ImagePicker();
    List<XFile>? selectImage;
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
      preferredCameraDevice: preferredCameraDevice,
      requestFullMetadata: requestFullMetadata,
    );
    if (image != null) {
      selectImage = [image];
    }
    return selectImage;
  }
}
