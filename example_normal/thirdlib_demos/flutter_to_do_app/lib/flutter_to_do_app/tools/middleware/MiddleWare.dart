import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import '../../pages/ToDoApp.dart';
import '../keys.dart';

class IntroMeddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (preferences!.getBool(DISPLAYINTRO) != null) {
      return const RouteSettings(name: '/Demo');
    } else {
      return null;
    }
  }
}
