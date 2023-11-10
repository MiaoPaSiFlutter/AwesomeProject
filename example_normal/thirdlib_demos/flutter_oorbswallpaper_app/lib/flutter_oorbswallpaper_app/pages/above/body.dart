import 'package:flutter/material.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/page_item0.dart';
import 'widgets/page_item1.dart';
import 'widgets/page_item2.dart';
import 'widgets/page_item3.dart';
import 'widgets/page_item4.dart';
import 'widgets/page_item5.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    pageViewController ??= PageController(initialPage: 0);
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 500,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: PageView(
                controller: pageViewController,
                scrollDirection: Axis.horizontal,
                children: [
                  Item0Widget(),
                  Item1Widget(),
                  Item2Widget(),
                  Item3Widget(),
                  Item4Widget(),
                  Item5Widget(),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: SmoothPageIndicator(
                  controller: pageViewController ??=
                      PageController(initialPage: 0),
                  count: 6,
                  axisDirection: Axis.horizontal,
                  onDotClicked: (i) {
                    pageViewController?.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  effect: ExpandingDotsEffect(
                    expansionFactor: 2,
                    spacing: 11,
                    radius: 12,
                    dotWidth: 10,
                    dotHeight: 4,
                    dotColor: FlutterFlowTheme.of(context).grayDark,
                    activeDotColor: FlutterFlowTheme.of(context).grayLight,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
