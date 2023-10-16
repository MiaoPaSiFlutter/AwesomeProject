import 'dart:async';

import 'package:flutter/material.dart';
import 'my_weather_canvas.dart';
import 'rain_widget.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  double t = 1.0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    const fps = 50.0;
    var frameDuration = (1000 ~/ fps);
    timer = Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
      setState(() {
        t = rng.nextDouble() < 0.001 ? 0.0 : t;
        t += 0.1;
        t = t > 1.0 ? 1.0 : t;
      });
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // depending on the weather condition, set the correct widget
      // in this case it's the rain widget. You could also have
      // sunny widget, snowy widget, etc..
      painter: MyWeatherCanvas(t),
      // depending on the weather condition, set the correct widget
      // in this case it's the rain widget. You could also have
      // sunny widget, snowy widget, etc..
      child:
          Center(child: Transform.scale(scale: 0.5, child: const RainWidget())),
    );
  }
}
