import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

final GlobalKey<SecondLayerState> secondLayerKey =
    GlobalKey<SecondLayerState>();

class SecondLayer extends StatefulWidget {
  const SecondLayer({super.key});

  @override
  SecondLayerState createState() => SecondLayerState();

  // openTab() => createState().openTab();
}

class SecondLayerState extends State<SecondLayer> {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: const Duration(milliseconds: 550),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF4c41a3),
        ),
        child: const Column(
          children: [
            Row(
              children: [],
            )
          ],
        ));
  }
}
