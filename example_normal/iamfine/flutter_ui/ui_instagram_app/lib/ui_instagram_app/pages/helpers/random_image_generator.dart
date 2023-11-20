import 'dart:math';

import 'utils.dart';

class RandomImageGenerator {
  // static var a = Directory('assets/images').listSync();
  static List<String> images =
      List.generate(8, (index) => Utils.assets("postImgs/${index + 1}.jpg"));

  static String randomImage() {
    // print(a.length);
    return images[Random().nextInt(images.length)];
  }
}
