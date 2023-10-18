import 'dart:convert';

///
/// 版本更新信息，用于显示版本更新弹窗
///
class UpdateEntity {
  //===========是否可以升级=============//

  ///是否有新版本
  final bool hasUpdate;

  ///是否强制安装：不安装无法使用app
  final bool isForce;

  ///是否可忽略该版本
  final bool isIgnorable;

  //===========升级的信息=============//

  ///版本号
  final int versionCode;

  ///版本名称
  final String? versionName;

  ///更新内容
  final String? updateContent;

  ///下载地址
  final String? downloadUrl;

  ///apk的大小[KB]
  final int apkSize;

  ///apk文件的加密值（这里默认是md5值）
  final String? apkMd5;

  UpdateEntity({
    this.hasUpdate = false,
    this.isForce = false,
    this.isIgnorable = false,
    this.versionCode = 0,
    this.versionName,
    this.updateContent,
    this.downloadUrl,
    this.apkSize = 0,
    this.apkMd5 = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'hasUpdate': hasUpdate,
      'isForce': isForce,
      'isIgnorable': isIgnorable,
      'versionCode': versionCode,
      'versionName': versionName,
      'updateContent': updateContent,
      'downloadUrl': downloadUrl,
      'apkSize': apkSize,
      'apkMd5': apkMd5,
    };
  }

  static UpdateEntity? fromMap(Map<String, dynamic> map) {
    return UpdateEntity(
      hasUpdate: map['hasUpdate'],
      isForce: map['isForce'],
      isIgnorable: map['isIgnorable'],
      versionCode: map['versionCode']?.toInt(),
      versionName: map['versionName'],
      updateContent: map['updateContent'],
      downloadUrl: map['downloadUrl'],
      apkSize: map['apkSize']?.toInt(),
      apkMd5: map['apkMd5'],
    );
  }

  String toJson() => json.encode(toMap());

  static UpdateEntity? fromJson(String source) => fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'UpdateEntity hasUpdate: $hasUpdate, isForce: $isForce, isIgnorable: $isIgnorable, versionCode: $versionCode, versionName: $versionName, updateContent: $updateContent, downloadUrl: $downloadUrl, apkSize: $apkSize, apkMd5: $apkMd5';
  }
}
/*
{
  "Code": 0,
  "Msg": "",
  "UpdateStatus": 1,
  "VersionCode": 3,
  "VersionName": "1.0.2",
  "UploadTime": "2018-07-10 17:28:41",
  "ModifyContent": "\r\n1、优化api接口。\r\n2、添加使用demo演示。\r\n3、新增自定义更新服务API接口。\r\n4、优化更新提示界面。",
  "DownloadUrl": "https://xuexiangjys.oss-cn-shanghai.aliyuncs.com/apk/xupdate_demo_1.0.2.apk",
  "ApkSize": 2048,
  "ApkMd5": "E4B79A36EFB9F17DF7E3BB161F9BCFD8"
}
*/