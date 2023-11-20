import 'package:flutter/material.dart';

import '../helper/utils.dart';

class ImageLoader {
  static String rootPaht = 'icons';

  static Image imageAsset(String icon) =>
      Image.asset(Utils.assets(rootPaht + icon));

  static Image imageNet(String url) => Image.network(url);
}
