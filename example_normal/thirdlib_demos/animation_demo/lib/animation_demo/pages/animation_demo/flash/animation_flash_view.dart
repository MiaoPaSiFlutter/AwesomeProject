import 'package:flutter/material.dart';
import '../flash/flash_animation_widget.dart';
import '../flash/gradient/default_linear_gradient.dart';

class AnimationFlashView extends StatelessWidget {
  const AnimationFlashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('闪光动画'),
        centerTitle: true,
      ),
      body: Center(
        child: FlashAnimation(
          gradient: DefaultLinearGradient(
            normalColor: Colors.blueAccent,
            highlightColor: Colors.redAccent,
          ),
          child: Container(
            child: const Text(
              'AnimationFlashView',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
