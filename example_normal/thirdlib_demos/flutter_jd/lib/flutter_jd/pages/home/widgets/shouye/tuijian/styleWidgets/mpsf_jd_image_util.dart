class MpsfJdImageUtil {
  static List getImageFrameFormUrl(String url) {
    List frame = [1, 1];
    List splitArr = url.split("/").toList();
    String frameS = "";
    for (var element in splitArr) {
      String item = element;
      if (item.startsWith("s") && item.endsWith("_jfs")) {
        frameS = item.replaceFirst("s", "");
        frameS = frameS.replaceFirst("_jfs", "");
      }
    }
    if (frameS.contains("x")) {
      List splitArr = frameS.split("x").toList();
      if (splitArr.length == 2) {
        String w = splitArr.first;
        String h = splitArr.last;
        try {
          frame[0] = int.parse(w);
          frame[1] = int.parse(h);
        } catch (e) {
          print("$e");
        }
      }
    }
    return frame;
  }
}
