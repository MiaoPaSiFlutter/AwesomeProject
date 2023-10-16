import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

import 'SecondLayer.dart';

class HomewPage extends StatefulWidget {
  const HomewPage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomewPage> with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: const Duration(milliseconds: 250),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: isOpen
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(0)),
            child: SafeArea(
              child: Stack(
                children: [
                  !isOpen
                      ? IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0xFF1f186f),
                          ),
                          onPressed: () {
                            setState(() {
                              xoffSet = 250;
                              yoffSet = 0;
                              angle = 0;
                              isOpen = true;
                            });
                            secondLayerKey.currentState?.setState(() {
                              secondLayerKey.currentState?.xoffSet = 122;
                              secondLayerKey.currentState?.yoffSet = 110;
                              secondLayerKey.currentState?.angle = -0.275;
                            });
                          })
                      : IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFF1f186f),
                          ),
                          onPressed: () {
                            if (isOpen == true) {
                              setState(() {
                                xoffSet = 0;
                                yoffSet = 0;
                                angle = 0;
                                isOpen = false;
                              });

                              secondLayerKey.currentState?.setState(() {
                                secondLayerKey.currentState?.xoffSet = 0;
                                secondLayerKey.currentState?.yoffSet = 0;
                                secondLayerKey.currentState?.angle = 0;
                              });
                            }
                          }),
                  Center(
                    child: Image.asset(
                      NormalModuleUtils.configPackagesImage(
                        packagename: 'common_demo',
                        name: "assets/welcome_bg.jpeg",
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                ],
              ),
            )));
  }
}
