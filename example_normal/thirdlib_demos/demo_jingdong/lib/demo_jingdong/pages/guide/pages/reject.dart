import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/skateboards.dart';
import '../provider/offsetNotifier.dart';
import '../app_style.dart';
import 'dart:math' as math;

import '../utils/fg_math_util.dart';

class Reject extends StatefulWidget {
  final int? index;
  const Reject({Key? key, this.index}) : super(key: key);

  @override
  State createState() => _RejectState();
}

class _RejectState extends State<Reject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            iconWg(),
            const SizedBox(height: 20),
            titleAndDescWg(),
          ],
        ),
      ),
    );
  }

  Widget iconWg() {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          circleAnimationWg(),
          skateboardAnimationWg(),
        ],
      ),
    );
  }

  Widget circleAnimationWg() {
    return Consumer<OffsetNotifier>(
      builder: (context, notifier, child) {
        double screenW = MediaQuery.of(context).size.width;
        double multiplier = 0;
        double lastOffset = screenW * (widget.index! - 1);

        FGMathLinear mathLinear2 = FGMathLinear.fromJsonPoint(
            FGMathPoint(0, 100), FGMathPoint(screenW, 0));

        if (notifier.offset >= lastOffset) {
          print("====>");
          double gap = notifier.offset - lastOffset;
          multiplier = mathLinear2.calculate(gap);
          multiplier = math.min(100, multiplier);
        } else {
          print("<====");
          double gap = notifier.offset - lastOffset;
          multiplier = mathLinear2.calculate(gap);
          multiplier = math.max(100, multiplier);
        }
        return Transform.translate(
          offset: Offset(0, -multiplier),
          child: child,
        );
      },
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget skateboardAnimationWg() {
    Skateboards skateboard = Skateboards.hotelList[widget.index!];

    return Consumer<OffsetNotifier>(
      builder: (context, notifier, child) {
        double screenW = MediaQuery.of(context).size.width;
        double multiplier = 0;
        double opacity = 0;
        double lastOffset = screenW * (widget.index! - 1);

        FGMathLinear mathLinear1 = FGMathLinear.fromJsonPoint(
            FGMathPoint(0, 0), FGMathPoint(screenW, 1));
        FGMathLinear mathLinear2 = FGMathLinear.fromJsonPoint(
            FGMathPoint(0, 100), FGMathPoint(screenW, 0));

        if (notifier.offset >= lastOffset) {
          print("====>");
          double gap = notifier.offset - lastOffset;
          multiplier = mathLinear2.calculate(gap);
          multiplier = math.min(100, multiplier);

          opacity = mathLinear1.calculate(gap);
          opacity = math.min(1, opacity);
        } else {
          print("<====");
          double gap = notifier.offset - lastOffset;
          multiplier = mathLinear2.calculate(gap);
          multiplier = math.max(100, multiplier);

          opacity = mathLinear1.calculate(gap);
          opacity = math.max(0, opacity);
        }
        //下移 + 透明度 + 缩放
        return Transform.translate(
          offset: Offset(0, -multiplier),
          child: Opacity(
            opacity: opacity.abs(),
            child: Transform.scale(
              scale: opacity.abs(),
              child: child,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(4, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: SizedBox(
              width: 100,
              height: double.infinity,
              child: Image.asset(skateboard.imagePath)),
        ),
      ),
    );
  }

  Widget titleAndDescWg() {
    Skateboards skateboard = Skateboards.hotelList[widget.index!];
    return Consumer<OffsetNotifier>(
      builder: (context, notifier, child) {
        double screenW = MediaQuery.of(context).size.width;
        double multiplier = 0;
        double opacity = 0;
        double lastOffset = screenW * (widget.index! - 1);

        // opacity 透明度的线性函数
        FGMathLinear mathLinear1 = FGMathLinear.fromJsonPoint(
            FGMathPoint(0, 0), FGMathPoint(screenW, 1));
        // Offset.Y 向下偏移的线性函数
        FGMathLinear mathLinear2 = FGMathLinear.fromJsonPoint(
            FGMathPoint(0, 100), FGMathPoint(screenW, 0));

        if (notifier.offset >= lastOffset) {
          print("====>");
          double gap = notifier.offset - lastOffset;
          opacity = mathLinear1.calculate(gap);
          opacity = math.min(1, opacity);

          multiplier = mathLinear2.calculate(gap);
          multiplier = math.min(100, multiplier);
        } else {
          print("<====");
          double gap = notifier.offset - lastOffset;
          opacity = mathLinear1.calculate(gap);
          opacity = math.max(0, opacity);

          multiplier = mathLinear2.calculate(gap);
          multiplier = math.max(100, multiplier);
        }
        return Transform.translate(
          offset: Offset(0, multiplier),
          child: Opacity(
            opacity: opacity.abs(),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: <Widget>[
            Text(skateboard.titleTxt, style: AppStyle.title),
            Text(skateboard.subTxt,
                style: AppStyle.subTxt, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
