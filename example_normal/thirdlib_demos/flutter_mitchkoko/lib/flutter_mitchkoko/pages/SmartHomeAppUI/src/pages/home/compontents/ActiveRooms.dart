import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../config/app_utils.dart';
import '../../../widgets/Ktext.dart';
import '../../../widgets/hex_color.dart';
import '../../../widgets/render_img.dart';
import '../../detail/details_page.dart';

class ActiveRooms extends StatefulWidget {
  const ActiveRooms({super.key});

  @override
  State<ActiveRooms> createState() => _ActiveRoomsState();
}

class _ActiveRoomsState extends State<ActiveRooms> {
  bool positive = false;
  bool loading = false;
  bool positive2 = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KText(text: 'Active', fontSize: 16),
                  KText(text: 'See All', fontSize: 16, color: Colors.blueGrey),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: Wrap(
                children: [
                  ActiveRoomItem(),
                  ActiveRoomItem2(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class ActiveRoomItem extends StatefulWidget {
  const ActiveRoomItem({super.key});

  @override
  State<ActiveRoomItem> createState() => _ActiveRoomItemState();
}

class _ActiveRoomItemState extends State<ActiveRoomItem> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const DetailsPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: HexColor('#9A7265'),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: RenderImg(
                      path: 'air-conditioner.png',
                      height: 65,
                      width: 65,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: KText(
                          text: 'Temprature',
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                          children: [
                            const TextSpan(text: '19$degree'),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(0.0, 5.0),
                                child: const Text(
                                  'c',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white70),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'AC',
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        KText(
                          text: 'Living room',
                          color: Colors.white70,
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                  AnimatedToggleSwitch<bool>.dual(
                    current: positive,
                    first: false,
                    second: true,
                    borderWidth: 3.0,
                    height: 22,
                    indicatorSize: const Size(25, 16),
                    style: const ToggleStyle(
                      // dif: 10.0,
                      borderColor: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, .5),
                        ),
                      ],
                    ),
                    onChanged: (b) {
                      setState(() => positive = b);
                      return Future.delayed(const Duration(seconds: 1));
                    },
                    styleBuilder: (value) => ToggleStyle(
                        backgroundColor:
                            value ? Colors.yellow[900] : Colors.teal),
                    iconBuilder: (value) => value
                        ? const Icon(
                            Icons.coronavirus_rounded,
                            size: 15,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.tag_faces_rounded,
                            size: 15,
                            color: HexColor('#ffffff'),
                          ),
                    textBuilder: (value) => value
                        ? Center(
                            child: KText(
                              text: 'ON',
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          )
                        : Center(
                            child: KText(
                                text: 'OFF',
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveRoomItem2 extends StatefulWidget {
  const ActiveRoomItem2({super.key});

  @override
  State<ActiveRoomItem2> createState() => _ActiveRoomItem2State();
}

class _ActiveRoomItem2State extends State<ActiveRoomItem2> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const DetailsPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: HexColor('#9A7265'),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: RenderImg(
                      path: 'light-bulbs.png',
                      height: 65,
                      width: 65,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: KText(
                            text: 'Colour',
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        KText(
                          text: 'White',
                          fontSize: 18,
                          color: Colors.white70,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'Lamp',
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                        KText(
                          text: 'Dining room',
                          color: Colors.white70,
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      AnimatedToggleSwitch<bool>.dual(
                        current: positive,
                        first: false,
                        second: true,
                        borderWidth: 3.0,
                        height: 22,
                        indicatorSize: const Size(25, 16),
                        style: const ToggleStyle(
                          // dif: 10.0,
                          borderColor: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, .5),
                            ),
                          ],
                        ),
                        onChanged: (b) {
                          setState(() => positive = b);
                          return Future.delayed(const Duration(seconds: 1));
                        },
                        styleBuilder: (value) => ToggleStyle(
                            backgroundColor:
                                value ? Colors.yellow[900] : Colors.teal),
                        // colorBuilder: (b) => b
                        //     ? Colors.yellow[900]
                        //     : Colors.teal,
                        iconBuilder: (value) => value
                            ? const Icon(
                                Icons.coronavirus_rounded,
                                size: 15,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.tag_faces_rounded,
                                size: 15,
                                color: HexColor('#ffffff'),
                              ),
                        textBuilder: (value) => value
                            ? Center(
                                child: KText(
                                  text: 'ON',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            : Center(
                                child: KText(
                                    text: 'OFF',
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                      ),
                    ],
                  ),
                  // AdvancedSwitch(
                  //   activeColor: HexColor('#659A6E'),
                  //   activeChild: KText(
                  //     text: 'ON',
                  //     color: Colors.white,
                  //     fontSize: 13,
                  //   ),
                  //   inactiveChild: KText(
                  //     text: 'OFF',
                  //     color: Colors.white,
                  //     fontSize: 13,
                  //   ),
                  //   width: 56,
                  //   height: 23,
                  //   controller: _controller03,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
