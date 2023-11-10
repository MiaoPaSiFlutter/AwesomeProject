import 'package:flutter/material.dart';
import 'package:flutter_oorbswallpaper_app/flutter_oorbswallpaper_app.dart';

final animationsMap = {
  'imageOnPageLoadAnimation': AnimationInfo(
    curve: Curves.linear,
    trigger: AnimationTrigger.onPageLoad,
    duration: 800,
    hideBeforeAnimating: true,
    fadeIn: true,
    initialState: AnimationState(
      scale: 1,
    ),
    finalState: AnimationState(
      scale: 1,
    ),
  ),
  'rowOnPageLoadAnimation1': AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    duration: 800,
    hideBeforeAnimating: true,
    fadeIn: true,
    initialState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1.5,
      opacity: 0,
    ),
    finalState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 1,
    ),
  ),
  'textOnPageLoadAnimation1': AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    duration: 600,
    hideBeforeAnimating: true,
    fadeIn: true,
    initialState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 0,
    ),
    finalState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 1,
    ),
  ),
  'rowOnPageLoadAnimation2': AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    duration: 800,
    hideBeforeAnimating: true,
    fadeIn: true,
    initialState: AnimationState(
      offset: const Offset(0, 0),
      scale: 0.5,
      opacity: 0,
    ),
    finalState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 1,
    ),
  ),
  'textOnPageLoadAnimation2': AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    duration: 600,
    hideBeforeAnimating: true,
    fadeIn: true,
    initialState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 0,
    ),
    finalState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 1,
    ),
  ),
  'columnOnPageLoadAnimation': AnimationInfo(
    curve: Curves.linear,
    trigger: AnimationTrigger.onPageLoad,
    duration: 800,
    hideBeforeAnimating: true,
    fadeIn: true,
    initialState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 0,
    ),
    finalState: AnimationState(
      offset: const Offset(0, 0),
      scale: 1,
      opacity: 1,
    ),
  ),
};
