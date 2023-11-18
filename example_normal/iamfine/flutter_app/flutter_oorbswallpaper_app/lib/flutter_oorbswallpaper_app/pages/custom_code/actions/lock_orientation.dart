// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
import 'package:flutter/services.dart';

Future lockOrientation() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
