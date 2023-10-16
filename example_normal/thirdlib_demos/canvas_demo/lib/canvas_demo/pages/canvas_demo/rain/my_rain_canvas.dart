import 'dart:math';

import 'package:flutter/material.dart';

import 'particle.dart';

class MyRainCanvas extends CustomPainter {
  final List<Particle> particles;
  MyRainCanvas(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2.0, size.height / 2.0);
    drawClouds(canvas, center);
    drawRain(canvas, center);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  // 绘制云朵
  void drawClouds(Canvas canvas, Offset center) {
    var c = Paint()
      ..color = const Color(0xff8e9aaf)
      ..style = PaintingStyle.fill;

    var p1 = const Offset(-50, -40) + center;
    var r1 = 90.0;
    canvas.drawCircle(p1, r1, c);

    var p2 = const Offset(-10, -50) + center;
    var r2 = 100.0;
    canvas.drawCircle(p2, r2, c);

    var p3 = const Offset(10, -10) + center;
    var r3 = 90.0;
    canvas.drawCircle(p3, r3, c);

    var p4 = const Offset(50, -10) + center;
    var r4 = 110.0;
    canvas.drawCircle(p4, r4, c);

    var p5 = const Offset(150, -10) + center;
    var r5 = 60.0;
    canvas.drawCircle(p5, r5, c);
  }

  //绘制雨滴
  var W = 600.0;
  void drawRain(Canvas canvas, Offset center) {
    var rain = Paint()
      ..color = const Color(0xffdee2ff) //Colors.black
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    var rect = Rect.fromCenter(center: center, width: 500, height: 600);
    canvas.clipRect(rect);
    canvas.save();
    canvas.translate(W - 250, -200);
    canvas.rotate(45.0 * pi / 180.0);

    for (var p in particles) {
      var p2 = p.position + Offset(0, p.length);
      var dd = const Offset(-50, 0);
      canvas.drawLine(p.position + center + dd, p2 + center + dd, rain);
    }
    canvas.restore();
  }
}
