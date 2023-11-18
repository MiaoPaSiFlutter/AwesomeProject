import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../config/app_utils.dart';
import '../../../consts/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor('#4C7380'),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: HexColor('#4C7380'),
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          RenderSvg(
                            path: 'home_top_cloud',
                            width: 80,
                          ),
                          Positioned(
                            top: 40,
                            child: KText(
                              text: 'Good Morning,',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      RenderSvg(
                        path: 'top_left_cloud',
                        width: 80,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: 'Goood Morning,',
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            KText(text: 'Kimberly Mastrangelo')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 15,
                          top: 35,
                          bottom: 20,
                        ),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        height: Get.height / 4.6,
                        width: Get.width,
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Container(
                            height: 166,
                            decoration: BoxDecoration(
                              color: AppColors.lightgrey,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 15, left: 12, right: 12),
                                      child: RenderSvg(
                                        height: 60,
                                        path: 'sun_behind_cloud',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 3,
                                        right: 3,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          KText(
                                              text: 'May 16, 2023 10:05 am',
                                              fontSize: 12),
                                          KText(text: 'Cloudy', fontSize: 18),
                                          KText(
                                              text: 'Jakara, Indonesia',
                                              fontSize: 12)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Row(
                                      children: [
                                        KText(
                                          text: '19$degree',
                                          fontSize: 42,
                                        ),
                                        KText(
                                          text: 'c',
                                          fontSize: 42,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Divider(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 63,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColors.morelightgrey),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: RenderImg(
                                                        path: 'drop.png',
                                                        height: 15,
                                                        width: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 25),
                                                      children: [
                                                        const TextSpan(
                                                          text: '97',
                                                        ),
                                                        WidgetSpan(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            child: const Text(
                                                              '%',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            KText(
                                              text: 'Humadity',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 63,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColors.morelightgrey),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(7.0),
                                                      child: RenderImg(
                                                        path: 'eye.png',
                                                        height: 15,
                                                        width: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 25),
                                                      children: [
                                                        const TextSpan(
                                                          text: '7',
                                                        ),
                                                        WidgetSpan(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            child: const Text(
                                                              'km',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            KText(
                                              text: 'Visibility',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 63,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColors.morelightgrey),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 35,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: RenderImg(
                                                        path: 'sonofoll.png',
                                                        height: 15,
                                                        width: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 25),
                                                      children: [
                                                        const TextSpan(
                                                          text: '3',
                                                        ),
                                                        WidgetSpan(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    0.0, 0.0),
                                                            child: const Text(
                                                              'km/h',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            KText(
                                              text: 'NE Wind',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: RenderSvg(path: 'sun_top'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
