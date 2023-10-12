
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'init/init.dart';
import 'config/config_index.dart';

void main() {
  runZonedGuarded(
    () => init(),
    (err, stace) {
      if (kDebugMode) {
        print(FlutterErrorDetails(exception: err, stack: stace));
      }
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        parent.print(zone, line);
      },
    ),
  );
}

void init() async {
  await GlobalConfig.init();
  runApp(initRunApp());
}

