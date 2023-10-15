import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

String kBCMUIDataPageFold = "BCM_UI_Data_Page_Cache";

class JMGLManager {
  static final JMGLManager _shared = JMGLManager._init();

  static JMGLManager shared() => _shared;

  JMGLManager._init() {
    _initMessageChannel();
  }

  void _initMessageChannel() {}

  ///保存文件
  Future<void> asyncSaveFile({String? contents, String? path}) async {
    try {
      String cachePageDataFoldPath = await createDirectory(kBCMUIDataPageFold);
      File file = File("$cachePageDataFoldPath/$path.json");
      //判断文件是否存在
      if (!file.existsSync()) {
        //文件不存在创建文件
        file.createSync();
        print('$path.json 创建成功');
      } else {
        print('$path.json 文件已存在');
      }
      // json文件写入
      file.writeAsString(contents ?? '');
    } catch (e) {
      print('$path.json 创建失败');
    }
  }

  ///读取文件
  Future<String?> syncFetchFile({String? path}) async {
    try {
      String cachePageDataFoldPath = await createDirectory(kBCMUIDataPageFold);
      File file = File("$cachePageDataFoldPath/$path.json");
      //判断文件是否存在
      if (file.existsSync()) {
        var jsonStr = await file.readAsString();
        print('$path.json 文件存在');
        return jsonStr;
      } else {
        print('$path.json 文件不存在');
        return null;
      }
    } catch (e) {
      print('$path.json 读取失败');
      return null;
    }
  }

  Future<void> clearCacheDirectory({String? path}) async {
    deleteDirectory(kBCMUIDataPageFold);
  }

  /// 创建文件夹
  Future<String> createDirectory(String url) async {
    if (await _requestPermission() == true) {
      final filepath = await getApplicationDocumentsDirectory();
      var file = Directory("${filepath.path}/$url");
      try {
        bool exists = await file.exists();
        if (!exists) {
          await file.create();
          print("文件夹-$url : 创建成功");
        } else {
          print("文件夹-$url : 已存在");
        }
      } catch (e) {
        print("文件夹-$url : 创建失败$e");
      }
      return file.path.toString();
    } else {
      return "";
    }
  }

  /// 删除文件夹
  Future<bool> deleteDirectory(String url) async {
    if (await _requestPermission() == true) {
      final filepath = await getApplicationDocumentsDirectory();
      var file = Directory("${filepath.path}/$url");
      try {
        bool exists = await file.exists();
        if (exists) {
          print("文件夹-$url : 存在,开始删除...");
          await file.delete(recursive: true);

          exists = await file.exists();
          if (!exists) {
            print("文件夹-$url : 已删除");
          }

          return true;
        } else {
          print("文件夹-$url : 文件夹不存在");
          return true;
        }
      } catch (e) {
        print("文件夹-$url : 删除失败$e");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> _requestPermission() async {
    if (await Permission.storage.status.isGranted) {
      return true;
    } else {
      if (await Permission.storage.request().isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
