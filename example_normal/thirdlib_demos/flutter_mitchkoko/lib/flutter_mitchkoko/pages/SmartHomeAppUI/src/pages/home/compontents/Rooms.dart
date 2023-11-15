import 'package:flutter/material.dart';

import '../../../config/app_utils.dart';
import '../../../widgets/Ktext.dart';
import '../../../widgets/hex_color.dart';
import '../../../widgets/render_img.dart';

class Rooms extends StatelessWidget {
  const Rooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KText(text: 'Rooms', fontSize: 16),
                KText(text: 'See All', fontSize: 16, color: Colors.blueGrey),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 5,
                  ),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: HexColor('#D8E4E8'),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          height: 25,
                          width: 52,
                          decoration: BoxDecoration(
                            color: HexColor('#4C7380'),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                                children: [
                                  const TextSpan(
                                    text: '19$degree',
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, 2.0),
                                      child: const Text(
                                        'c',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: RenderImg(
                            path: 'living-room.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Center(
                          child: KText(
                            text: 'Living Room',
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 20,
                              decoration: BoxDecoration(
                                color: HexColor('#FFE266'),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 3,
                                ),
                                child: Center(
                                  child: KText(text: '5', fontSize: 16),
                                ),
                              ),
                            ),
                            KText(
                              text: ' devices',
                              color: Colors.black54,
                              fontSize: 16,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 15,
                  ),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: HexColor('#D8E4E8'),
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                          ),
                          height: 25,
                          width: 52,
                          decoration: BoxDecoration(
                            color: HexColor('#4C7380'),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                                children: [
                                  const TextSpan(
                                    text: '19$degree',
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, 2.0),
                                      child: const Text(
                                        'c',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: RenderImg(
                            path: 'bedroom.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Center(
                          child: KText(
                            text: 'Living Room',
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 20,
                              decoration: BoxDecoration(
                                color: HexColor('#FFE266'),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 3,
                                ),
                                child: Center(
                                  child: KText(
                                    text: '8',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            KText(
                              text: ' devices',
                              color: Colors.black54,
                              fontSize: 16,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
