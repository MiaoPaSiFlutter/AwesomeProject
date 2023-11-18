/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-03-19 20:59:21
 * @LastEditors: TT
 * @LastEditTime: 2023-09-07 17:43:25
 */

import 'package:get/get.dart';

import 'package:hzy_normal_tool/hzy_normal_tool.dart';
import 'package:permission_handler/permission_handler.dart';

import 'getx_util_tool.dart';
import 'utils.dart';

/// 权限描述语
class PermissionMsgConfig {
  // ------------- 权限弹框 描述语 ------------- //
  static String bluetoothMsg = "请打开手机蓝牙功能";
  static String bluetoothAdvertiseMSg = "请允许APP使此设备可被其他用户发现";
  static String bluetoothConnectMsg = "请允许APP连接已配对的蓝牙设备";
  static String bluetoothScanMsg = "请允许APP查找周围蓝牙设备，来给您提供更好的服务";
  static String locationWhenInUseMsg = "请允许用户使用位置信息";
  static String photosMsg = "需要打开相册权限才能加载相册哦~";
  static String cameraMsg = '需要打开相机权限才能拍照哦~';
  // ------------- 权限弹框 提示语 ------------- //
  static String blueTitle = "蓝牙权限未开启";
  static String photoTitle = "相册权限未开启";
  static String cameraTitle = "相机权限未开启";
  static String locationWhenInUseTitle = "位置权限未开启";
}

class PermissionHelper {
  /*
   * @description: 申请权限
   * @param {
   *     permissionList 权限列表
   * }
   * @return { 
   *     <List<Permission>> 返回不能使用的权限列表
   * }
   */
  static Future<List<Permission>> checkPermission({
    required List<Permission> permissionList,
  }) async {
    bool flag = true;
    for (var value in permissionList) {
      var status = await value.status;
      if (!status.isGranted) {
        flag = false;
        break;
      }
    }
    List<Permission> list = [];
    if (!flag) {
      Map<Permission, PermissionStatus> statuses =
          await permissionList.request();
      statuses.forEach((key, value) {
        if (!value.isGranted) {
          list.add(key);
        }
      });
    }
    return list;
  }

  /// 检查权限
  /// 备注说明： 此方法在2.0版本将会废弃
  static void check(
    List<Permission> permissionList, {
    Function()? onSuccess,
    Function(Permission? permission)? onFailed,
    Function(Permission? permission)? onOpenSetting,
  }) async {
    bool flag = true;
    Permission? permission;
    for (var value in permissionList) {
      var status = await value.status;
      if (!status.isGranted) {
        flag = false;
        permission = value;
        break;
      }
    }
    if (!flag) {
      PermissionStatus permissionStatus = await requestPermission(
        permissionList: permissionList,
      );
      if (permissionStatus.isGranted) {
        //权限通过
        if (onSuccess != null) {
          onSuccess();
        }
      } else if (permissionStatus.isDenied) {
        //权限拒绝， 需要区分IOS和Android，二者不一样
        if (onFailed != null) {
          onFailed(permission);
        }
      } else if (permissionStatus.isPermanentlyDenied) {
        //权限永久拒绝，且不在提示，需要进入设置界面，IOS和Android不同
        permissionOpenSetting(
          onOpenSetting: onOpenSetting,
          permission: permission,
        );
      } else if (permissionStatus.isRestricted) {
        //活动限制（例如，设置了家长///控件，仅在iOS以上受支持。
        //IOS单独处理
        permissionOpenSetting(
          onOpenSetting: onOpenSetting,
          permission: permission,
        );
      } else if (permissionStatus.isLimited) {
        //IOS单独处理
        permissionOpenSetting(
          onOpenSetting: onOpenSetting,
          permission: permission,
        );
      }
    } else {
      //权限通过
      //权限通过
      if (onSuccess != null) {
        onSuccess();
      }
    }
  }

  /// 配置通用权限失败后跳设置界面
  static permissionOpenSetting({
    Function(Permission? permission)? onOpenSetting,
    Permission? permission,
  }) {
    if (onOpenSetting != null) {
      onOpenSetting(permission);
    } else {
      openAppSettings();
    }
  }

  /*
   * @description: 申请权限
   * @param {
   *     permissionList 权限列表
   * }
   * @return {*}
   *  备注说明： 此方法在2.0版本将会废弃
   */
  static Future<PermissionStatus> requestPermission({
    required List<Permission> permissionList,
  }) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }

  /*
   * @description: 权限未开通 
   * 配置弹窗提示语
   * @param {
   *    permission 权限类型
   * }
   * @return {*}
   */
  static configPermissionMsg({
    required Permission permission,
  }) {
    String msg = "";
    if (permission == Permission.bluetooth) {
      msg = PermissionMsgConfig.bluetoothMsg;
    } else if (permission == Permission.bluetoothAdvertise) {
      /// Android：允许用户使此设备可被其他用户发现
      msg = PermissionMsgConfig.bluetoothAdvertiseMSg;
    } else if (permission == Permission.bluetoothConnect) {
      /// Android：允许用户连接已配对的蓝牙设备。
      msg = PermissionMsgConfig.bluetoothConnectMsg;
    } else if (permission == Permission.bluetoothScan) {
      /// Android：允许用户查找蓝牙设备
      msg = PermissionMsgConfig.bluetoothScanMsg;
    } else if (permission == Permission.locationWhenInUse) {
      msg = PermissionMsgConfig.locationWhenInUseMsg;
    } else if (permission == Permission.photosAddOnly ||
        permission == Permission.storage) {
      msg = PermissionMsgConfig.photosMsg;
    } else if (permission == Permission.camera) {
      msg = PermissionMsgConfig.cameraMsg;
    }
    return msg;
  }

  /*
   * @description: 权限未开通
   * 配置弹窗标题
   * @param {
   *    permission 权限类型
   * }
   * @return {*}
   */
  static configPermissionTitle({
    required Permission permission,
  }) {
    String title = "";
    switch (permission) {
      case Permission.bluetooth:
      case Permission.bluetoothAdvertise:
      case Permission.bluetoothConnect:
      case Permission.bluetoothScan:
        title = PermissionMsgConfig.blueTitle;
        break;
      case Permission.locationWhenInUse:
        title = PermissionMsgConfig.locationWhenInUseTitle;
        break;
      case Permission.photosAddOnly:
      case Permission.storage:
        title = PermissionMsgConfig.photoTitle;
        break;
      case Permission.camera:
        title = PermissionMsgConfig.cameraTitle;
        break;
      default:
    }
    return title;
  }

  /*
   * @description: 权限未开通
   * 弹框提示,跳转设置界面
   * @param {
   *    permission 权限类型
   * }
   * @return {*}
   */
  static permissionPopUpWidget({
    required Permission permission,
  }) {
    loadDismiss();
    showPopDiaLogWidget(
      context: Get.context!,
      title: configPermissionTitle(
        permission: permission,
      ),
      msg: configPermissionMsg(
        permission: permission,
      ),
      tapSure: () {
        currentGoback();
        openAppSettings();
      },
    );
  }
}
