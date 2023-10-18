import 'dart:io';

import 'package:hzy_common_module/hzy_common_module.dart';

class CacheManager {
  /// 递归计算文件、文件夹的大小
  static Future<double> getTotalSizeOfFilesInDir(
      final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  }

  /// 缓存大小格式转换
  static String formatSize(double value) {
    List<String> unitArr = ['B', 'K', 'M', 'G'];
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  static Future<double> loadApplicationCache() async {
    //获取文件夹
    Directory docDirectory = await getApplicationDocumentsDirectory();
    Directory tempDirectory = await getTemporaryDirectory();

    double size = 0;

    if (docDirectory.existsSync()) {
      size += await getTotalSizeOfFilesInDir(docDirectory);
    }
    if (tempDirectory.existsSync()) {
      size += await getTotalSizeOfFilesInDir(tempDirectory);
    }
    return size;
  }

  /// 删除文件夹下所有文件、或者单一文件
  static Future<void> deleteDirectory(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await deleteDirectory(child);
        await child.delete();
      }
    }
  }

  /// 删除部分文件夹缓存示例
  static Future<void> clearApplicationCache() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    Directory tempDirectory = await getTemporaryDirectory();

    if (docDirectory.existsSync()) {
      await deleteDirectory(docDirectory);
    }

    if (tempDirectory.existsSync()) {
      await deleteDirectory(tempDirectory);
    }
  }

  /// 将数据内容写入doc文件夹里，如果不传direcName，默认存doc文件夹
  /// fileName: 文件名
  /// notes 要存储的内容
  /// direcName 文件夹名字，如分类，首页，购物车，我的等。可不传
  static void writeToFile(String fileName, String notes,
      {String? direcName}) async {
    //获取doc路径
    Directory documentsDir = await getApplicationDocumentsDirectory();
    if (!documentsDir.existsSync()) {
      documentsDir.createSync();
    }

    //用户文件夹，如果有uid,用uid见文件夹，没有建tourist
    // String userId = LoginManager.uid;

    String userId = "user_001";
    String userFileDirec = '${documentsDir.path}/$userId';
    documentsDir = Directory(userFileDirec);
    if (!documentsDir.existsSync()) {
      documentsDir.createSync();
    }

    //功能文件夹
    if (direcName != null) {
      String path = '${documentsDir.path}/$direcName';
      documentsDir = Directory(path);
    }
    if (!documentsDir.existsSync()) {
      documentsDir.createSync();
    }
    String documentsPath = documentsDir.path;
    File file = File('$documentsPath/$fileName');
    if (!file.existsSync()) {
      file.createSync();
    }

    //写入文件
    File file1 = await file.writeAsString(notes);
    if (file1.existsSync()) {
      print("保存成功");
    }
  }
}
