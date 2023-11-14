import 'package:flutter/material.dart';
import "package:animations/animations.dart";

//TODO：通过撰写和回复 FAB（运动）之间的过渡添加淡入淡出
class FadeThroughTransitionSwitcher extends StatelessWidget {
  const FadeThroughTransitionSwitcher({
    super.key,
    required this.fillColor,
    required this.child,
  });

  final Widget child;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          fillColor: fillColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}
