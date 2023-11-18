import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hzy_normal_config/hzy_normal_colors.dart';
import '../hzy_normal_config/page_state.dart';
import '../hzy_normal_widgets/hzy_normal_widgets_index.dart';

/// 通用点击回调
typedef TapIndexCallback = void Function(
  int index,
);
typedef TapIndexOptionCallback = void Function(
  int? index,
);
typedef TapCallback = void Function();
typedef TapBoolCallback = void Function(
  bool yorn,
);
typedef TapItemCallback = void Function(
  HzyNormalItemModel itemModel,
  int? index,
);

class HzyNormalTools {
  // 根据列表数据 配置界面状态
  static configPageState({
    required int allNum,
    required int networkNum,
    int? pageSize,
  }) {
    PageState st = PageState.dataFetchState;
    if (allNum == 0) {
      st = PageState.emptyDataState;
    } else if (networkNum == 0) {
      st = PageState.noMoreDataState;
    } else if (pageSize != null && pageSize > networkNum) {
      st = PageState.noMoreDataState;
    }
    return st;
  }

  // 配置 yyyy-mm-dd
  static String configyyyymmdd({
    required int year,
    required int m,
    required int d,
  }) {
    String ystr = "$year";
    String mstr = "$m";
    String dStr = '$d';
    if (m < 10) {
      mstr = "0$m";
    }
    if (d < 10) {
      dStr = "0$d";
    }
    return "$ystr-$mstr-$dStr";
  }

  // 配置几分钟前
  static String messageTime(int timeStamp) {
    int time = DateTime.now().millisecondsSinceEpoch;
    String msg = '';
    int distance = ((time - timeStamp) / 1000).round();
    if (distance <= 60) {
      msg = '刚刚';
    } else if (distance <= 3600) {
      msg = '${(distance / 60).floor()}分钟前';
    } else if (distance <= 43200) {
      msg = '${(distance / 60 / 60).floor()}小时前';
    } else if (DateTime.fromMillisecondsSinceEpoch(time).year ==
        DateTime.fromMillisecondsSinceEpoch(timeStamp).year) {
      msg = commentformatDate(
        dateTime: DateTime.fromMillisecondsSinceEpoch(timeStamp),
        format: 'MM-dd HH:mm',
      );
    } else {
      msg = commentformatDate(
        dateTime: DateTime.fromMillisecondsSinceEpoch(timeStamp),
        format: 'YY-MM-dd HH:mm',
      );
    }

    return msg;
  }

  static String commentformatDate({
    required DateTime dateTime,
    String? format,
  }) {
    format = format ?? "yyyy-MM-dd HH:mm:ss";
    if (format.contains('yy')) {
      String year = dateTime.year.toString();
      if (format.contains('yyyy')) {
        format = format.replaceAll('yyyy', year);
      } else {
        format = format.replaceAll(
            'yy', year.substring(year.length - 2, year.length));
      }
    }

    format = commentcomFormat(dateTime.month, format, 'M', 'MM');
    format = commentcomFormat(dateTime.day, format, 'd', 'dd');
    format = commentcomFormat(dateTime.hour, format, 'H', 'HH');
    format = commentcomFormat(dateTime.minute, format, 'm', 'mm');
    format = commentcomFormat(dateTime.second, format, 's', 'ss');
    format = commentcomFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  /// com format.
  static String commentcomFormat(
    int value,
    String format,
    String single,
    String full,
  ) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }

  /// 获取图片地址
  static String getImagePath(
    String name, {
    String format = 'png',
  }) {
    return 'assets/images/$name.$format';
  }

  // 校验手机号
  static bool chinaPhoneNumber(String input) {
    if (input.isEmpty) return false;
    //手机正则验证
    String regexPhoneNumber =
        "^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$";
    return RegExp(regexPhoneNumber).hasMatch(input);
  }

  static String formatNum(
    double num, {
    int postion = 2,
  }) {
    String money = formartNum(num, 2);
    return money;
  }

  static String formartNum(
    num target,
    int postion, {
    bool isCrop = false,
  }) {
    String t = target.toString();
    // 如果要保留的长度小于等于0 直接返回当前字符串
    if (postion < 0) {
      return t;
    }
    if (t.contains(".")) {
      String t1 = t.split(".").last;
      if (t1.length >= postion) {
        if (isCrop) {
          // 直接裁剪
          return t.substring(0, t.length - (t1.length - postion));
        } else {
          // 四舍五入
          return target.toStringAsFixed(postion);
        }
      } else {
        // 不够位数的补相应个数的0
        String t2 = "";
        for (int i = 0; i < postion - t1.length; i++) {
          t2 += "0";
        }
        return t + t2;
      }
    } else {
      // 不含小数的部分补点和相应的0
      String t3 = postion > 0 ? "." : "";

      for (int i = 0; i < postion; i++) {
        t3 += "0";
      }
      return t + t3;
    }
  }

  // 通用间隔
  static Widget configlineSpace({
    double height = 0.5,
    Color color = HzyNormalColorS.cole3e3e3,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Decoration? decoration,
  }) {
    return Container(
      height: height,
      decoration: decoration ??
          BoxDecoration(
            color: color,
          ),
      padding: padding,
      margin: margin,
    );
  }

  // 设置键盘 隐藏
  static keydissmiss(
    BuildContext context,
  ) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  // 赋值剪切板内容
  static setDataToClipboard({
    required String text,
    Function? copyBlock,
  }) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (copyBlock != null) {
      copyBlock();
    }
  }

  // 获取剪切板内容
  static getDataToClipboard() {
    return Clipboard.getData(Clipboard.kTextPlain);
  }

  ///计算页数
  static int getPageCount(int? totalCount, int? pageSize) {
    if (totalCount != null && pageSize != null) {
      return (totalCount + pageSize - 1) ~/ pageSize;
    } else {
      return 0;
    }
  }

  ///分割数组
  static List splitList(List? items, int? subSize) {
    if (items != null && subSize != null) {
      int index = 0;
      var bigRes = [];

      for (var i = 0; i < items.length; i++) {
        if (i % subSize == 0 && i != 0) {
          // 可以被 size 整除
          bigRes.add(items.sublist(index, i));
          index = i;
        }
        if ((i + 1) == items.length) {
          bigRes.add(items.sublist(index, (i + 1)));
        }
      }
      return bigRes;
    } else {
      return [];
    }
  }

  ///设置item圆角
  static BorderRadius buildFeedCellRadius(int? items, int? index,
      {double radius = 12}) {
    if (items != null && index != null) {
      Radius topLeft = Radius.zero;
      Radius topRight = Radius.zero;
      Radius bottomLeft = Radius.zero;
      Radius bottomRight = Radius.zero;
      if (index == 0) {
        ///第一个
        topLeft = topRight = Radius.circular(radius);
      } else if (index == items - 1) {
        ///最后一个
        bottomLeft = bottomRight = Radius.circular(radius);
      } else {
        ///位于中间
      }

      ///if only one item
      if (index == items - 1) {
        bottomLeft = bottomRight = Radius.circular(radius);
      }
      BorderRadius borderRadius = BorderRadius.only(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );

      return borderRadius;
    } else {
      return BorderRadius.all(Radius.circular(radius));
    }
  }
}

/// debug 环境下,日志输出
dPrint(Object? object) {
  if (kIsWeb) {
    if (kDebugMode) {
      print(object.toString());
    }
  } else {
    log(object.toString());
  }
}

/// 信息太长,分段打印
p(String msg) {
  //因为String的length是字符数量不是字节数量所以为了防止中文字符过多，
  //  把4*1024的MAX字节打印长度改为1000字符数
  int maxStrLength = 1000;
  //大于1000时
  while (msg.length > maxStrLength) {
    if (kDebugMode) {
      print(msg.substring(0, maxStrLength));
    }
    msg = msg.substring(maxStrLength);
  }
  if (kDebugMode) {
    //剩余部分
    print(msg);
  }
}

// 颜色 16进制
Color getColorFromHex(String? hexColor) {
  if (hexColor == "null" || hexColor == "" || hexColor == null) {
    return Colors.black;
  } else {
    return Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
  }
}

/// 从下往上弹框
configShowBottomSheet({
  required BuildContext context,
  required Widget child,
  BoxConstraints? constraints,
  Color? backgroundColor = Colors.transparent,
  ShapeBorder? shape = const ContinuousRectangleBorder(),
  bool isScrollControlled = false,
}) async {
  return await showModalBottomSheet(
    context: context,
    constraints: constraints,
    backgroundColor: backgroundColor,
    isScrollControlled: isScrollControlled,
    shape: shape,
    builder: (ct) => child,
  );
}

showDig({
  required BuildContext context,
  required Widget widget,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
}) async {
  return await showDialog(
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return widget;
    },
  );
}
