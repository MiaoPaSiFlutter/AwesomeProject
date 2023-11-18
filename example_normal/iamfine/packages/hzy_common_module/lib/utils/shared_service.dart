import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedService使用：
/// void main() async {
/// WidgetsFlutterBinding.ensureInitialized();
/// await SharedService.getInstance(); // 1. 初始化
/// 2. 使用（写入数据）
/// SharedService.set("service_string", "service_string");
/// SharedService.set("service_int", 123);
/// SharedService.set("service_double", 2.2);
/// SharedService.set("service_map", {"a":"1", "b":2});
/// 3. 读取数据
/// Text(SharedService.get("service_string")?.toString() ?? "null"),
/// Text(SharedService.get("service_int")?.toString() ?? "null"),
/// Text(SharedService.get("service_map")?.toString() ?? "null"),
/// Text((SharedService.get("service_map") as Map)["a"]),
/// 4. 不同平台具体的实现
/// Android：SharedPreferences
/// iOS/MacOs：NSUserDefault
/// Web：LocalStorage
/// Windows: in the roaming appData directory
/// Linuex: In the XDG_DATA_HOME directory.
///

/// 封装 SharedPreferences。
class SharedService {
  // 单例生命。
  factory SharedService() => _instance;

  SharedService._internal();

  static final SharedService _instance = SharedService._internal();

  // 保持一个sp的引用
  static late final SharedPreferences _sp;

  /// 初始化方法，只调用一次
  static Future<SharedService> getInstance() async {
    _sp = await SharedPreferences.getInstance();
    return _instance;
  }

  /// 写入数据
  static void set<T>(String key, T value) {
    Type type = value.runtimeType;
    switch (type) {
      case String:
        _sp.setString(key, value as String);
        break;
      case int:
        _sp.setInt(key, value as int);
        break;
      case bool:
        _sp.setBool(key, value as bool);
        break;
      case double:
        _sp.setDouble(key, value as double);
        break;
      case const (List<String>):
        _sp.setStringList(key, value as List<String>);
        break;
    }

    /// map不能直接判断Type类型，他是一个_InternalLinkedHashMap是一个私有类型，没有办法引用出来。
    if (value is Map) {
      // map，转成json格式的字符串进行保存。序列化成json字符串
      _sp.setString(key, json.encode(value));
      return;
    }
  }

  /// 根据key。读取数据，
  static Object? get<T>(String key) {
    var value = _sp.get(key);
    if (value is String) {
      try {
        // 反序列化，处理map，原样返回map回去。
        // ignore: unnecessary_cast
        return const JsonDecoder().convert(value as String)
            as Map<String, dynamic>;
      } on FormatException {
        return value; // 返回字符串
      }
    }
    return value;
  }

  /// -------------其他方法封装-----------------
  /// 获取所有的key
  static Set<String> getKeys() {
    return _sp.getKeys();
  }

  /// 判断数据中是否包含某个key
  static bool containsKey(String key) {
    return _sp.containsKey(key);
  }

  /// 删除数据中某个key
  static Future<bool> remove(String key) async {
    return await _sp.remove(key);
  }

  /// 清空所有数据
  static Future<bool> clear() async {
    return await _sp.clear();
  }

  /// 重新加载
  static Future<void> reload() async {
    return await _sp.reload();
  }
}
