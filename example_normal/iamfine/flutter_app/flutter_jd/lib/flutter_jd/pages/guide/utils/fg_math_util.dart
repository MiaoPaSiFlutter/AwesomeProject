class FGMathUtil {
  //   double multiplier;
  // double maxOffsetY = 50; //最大偏移距离
  // if (notifier.page <= 1.0) {
  //   double dy = 0;
  //   double k = maxOffsetY;
  //   double b = -maxOffsetY;
  //   dy = k * notifier.page + b;
  //   multiplier = math.max(0, dy.abs());

  // }
}

class FGMathPoint {
  final double x;
  final double y;

  FGMathPoint(this.x, this.y);
}

///直线两点求斜率公式
class FGMathLinear {
  late double k;
  late double b;

  FGMathLinear.fromJsonPoint(FGMathPoint point1, FGMathPoint point2) {
    k = 0;
    b = 0;
    if ((point1.x - point2.x) != 0) {
      k = (point1.y - point2.y) / (point1.x - point2.x);
      b = point1.y - k * point1.x;
    } else {
      print("斜率不存在啊");
    }
  }

  double calculate(double x) {
    return k * x + b;
  }
}
