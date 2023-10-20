import 'dart:convert' show json;
import 'package:flutter/rendering.dart';

void tryCatch(Function f) {
  try {
    f.call();
  } catch (e, stack) {
    debugPrint('$e');
    debugPrint('$stack');
  }
}

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  if (value != null) {
    final String valueS = value.toString();
    if (0 is T) {
      return int.tryParse(valueS) as T?;
    } else if (0.0 is T) {
      return double.tryParse(valueS) as T?;
    } else if ('' is T) {
      return valueS as T;
    } else if (false is T) {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    }
  }
  return null;
}

class TuChongSource {
  TuChongSource({
    this.page,
    this.pageSize,
    this.list,
  });
  factory TuChongSource.fromJson(Map<String, dynamic> jsonRes) {
    final List<dynamic>? list = jsonRes['list'] is List ? <dynamic>[] : null;
    if (list != null) {
      for (final dynamic item in jsonRes['list']) {
        if (item != null) {
          tryCatch(() {
            list.add(item);
          });
        }
      }
    }

    return TuChongSource(
      page: asT<int>(jsonRes['page']),
      pageSize: asT<int>(jsonRes['page']),
      list: list,
    );
  }

  final int? page;
  final int? pageSize;
  final List<dynamic>? list;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'page': page,
        'pageSize': pageSize,
        'list': list,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
