import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../../../widgets/Ktext.dart';
import '../../../widgets/hex_color.dart';
import '../../../widgets/render_svg.dart';

class ScheuleItem extends StatefulWidget {
  final Map<String, Object> item;
  const ScheuleItem({super.key, required this.item});

  @override
  State<ScheuleItem> createState() => _ScheuleItemState();
}

class _ScheuleItemState extends State<ScheuleItem> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 12),
      height: 110,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: '${widget.item['title']}',
                      fontSize: 15,
                    ),
                    KText(
                      text: '${widget.item['category']}  | Tue Thu',
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                // RenderSvg(path: 'on_icon')

                AnimatedToggleSwitch<bool>.dual(
                  current: positive,
                  first: false,
                  second: true,
                  borderWidth: 3.0,
                  height: 26,
                  indicatorSize: const Size(30, 20),
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
                  // colorBuilder: (b) =>
                  // b ? Colors.yellow[900] : Colors.teal,
                  iconBuilder: (value) => value
                      ? const Icon(
                          Icons.coronavirus_rounded,
                          size: 19,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.tag_faces_rounded,
                          size: 19,
                          color: HexColor('#ffffff'),
                        ),
                  textBuilder: (value) => value
                      ? Center(
                          child: KText(
                            text: 'ON',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )
                      : Center(
                          child: KText(
                              text: 'OFF',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                RenderSvg(
                  path: '${widget.item['image']}',
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 57,
                  ),
                  child: Column(
                    children: [
                      KText(
                        text: 'from',
                        fontWeight: FontWeight.w400,
                      ),
                      KText(
                        text: '8 pm',
                        fontSize: 16,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey,
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    KText(
                      text: 'to',
                      fontWeight: FontWeight.w400,
                    ),
                    KText(
                      text: '8 am',
                      fontSize: 16,
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.blueGrey,
                ),
                const Spacer(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RenderSvg(path: 'delete', height: 18),
                    SizedBox(height: 10),
                    RenderSvg(path: 'edit', height: 18),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
