import 'package:hzy_common_module/hzy_common_module.dart';

class PrefsDBService {
  static Future<bool> isFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? userData = prefs.getStringList('CRData');
    return userData == null;
  }

  static saveCRData({
    required String name,
    required String batchCode,
    required String deptCode,
    required String section,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('CRData', [name, batchCode, deptCode, section]);
  }

  static Future<List<String>?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? cRData = prefs.getStringList('CRData');
    return cRData;
  }
}
