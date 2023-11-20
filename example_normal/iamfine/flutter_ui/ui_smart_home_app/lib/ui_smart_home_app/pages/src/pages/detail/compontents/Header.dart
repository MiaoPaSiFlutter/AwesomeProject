import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/handler_animation.dart';
import 'package:another_xlider/models/hatch_mark.dart';
import 'package:another_xlider/models/ignore_steps.dart';
import 'package:another_xlider/models/slider_step.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../widgets/Ktext.dart';
import '../../../widgets/hex_color.dart';
import '../../../widgets/render_img.dart';
import '../../../widgets/render_svg.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  double _lv4 = 0;
  double _uv4 = 2500;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 1.1,
      decoration: BoxDecoration(color: HexColor('#4C7380')),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                decoration: BoxDecoration(
                  color: HexColor('#4C7380'),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 8),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: KText(
                                  text: 'Back',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 8),
                          child: KText(
                            text: 'Dining Room',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 5),
                          child: RenderSvg(path: 'off_icon'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 50),
                              children: [
                                const TextSpan(text: '80'),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(0.0, 0.0),
                                    child: const Text(
                                      ' %',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: KText(
                            text: 'Brightness',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: KText(
                            text: 'Insensity',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 45, top: 25),
                              child: KText(
                                textAlign: TextAlign.start,
                                text: 'Lamp',
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                            const RenderImg(
                              path: 'bg_lamp.png',
                              fit: BoxFit.cover,
                              width: 120,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: HexColor('#4C7380'),
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: RenderSvg(
                              path: 'off_light',
                              height: 45,
                            ),
                          )),
                      Expanded(
                        flex: 13,
                        child: _hatchMarkWithLabels(),
                      ),
                      const Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: RenderSvg(
                              path: 'on_light',
                              height: 30,
                            ),
                          )),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(color: Colors.white60),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        KText(
                          text: 'Usages',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KText(
                          text: 'Use Today',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        KText(
                          text: '50 watt',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KText(
                          text: 'Use Week',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        KText(
                          text: '500 Kwh',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KText(
                          text: 'Use Month',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        KText(
                          text: '5000 kwh',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _hatchMarkWithLabels() {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: ListTile(
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FlutterSlider(
                key: const Key('3343'),
                values: [_lv4, _uv4],
                touchSize: 20.0,
                handlerAnimation: const FlutterSliderHandlerAnimation(
                    reverseCurve: Curves.bounceOut,
                    curve: Curves.bounceIn,
                    duration: Duration(milliseconds: 500),
                    scale: 1.5),
                rangeSlider: true,
                ignoreSteps: [
                  FlutterSliderIgnoreSteps(from: 500, to: 1000),
                ],
                hatchMark: FlutterSliderHatchMark(
                  displayLines: true,
                  linesDistanceFromTrackBar: 10,
                  labelBox: FlutterSliderSizedBox(
                    width: 40,
                    height: 20,
                    foregroundDecoration:
                        const BoxDecoration(color: Colors.white),
                    transform: Matrix4.translationValues(0, 10, 0),
                  ),
                  density: 0.5,
                ),
                rightHandler: FlutterSliderHandler(
                  decoration: const BoxDecoration(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor('#9A7265'),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                tooltip: FlutterSliderTooltip(
                  alwaysShowTooltip: false,
                ),
                max: 4000,
                min: 0,
                step: const FlutterSliderStep(step: 80),
                jump: true,
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lv4 = lowerValue;
                    _uv4 = upperValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
