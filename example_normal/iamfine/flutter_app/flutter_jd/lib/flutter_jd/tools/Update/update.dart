import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'update_parser.dart';
import 'update_prompter.dart';
import 'utils/common.dart';
import 'utils/http.dart';
import 'utils/toast.dart';

/// 版本更新管理
class UpdateManager {
  ///全局初始化
  static init(
    String baseUrl, {
    Duration timeout = const Duration(milliseconds: 5000),
    Map<String, dynamic>? headers,
  }) {
    HttpUtils.init(baseUrl, timeout: timeout, headers: headers);
  }

  static void checkUpdate(BuildContext context, String url) {
    HttpUtils.get(url).then((response) {
      UpdateParser.parseJson(convert.jsonEncode(response)).then(
        (value) => {
          if (value != null)
            {
              UpdatePrompter(
                updateEntity: value,
                onInstall: (String filePath) {
                  CommonUtils.installAPP(filePath);
                },
              ).show(context)
            }
        },
      );
    }).catchError((onError) {
      ToastUtils.error(onError);
    });
  }
}

typedef InstallCallback = Function(String filePath);
