import 'package:flutter/material.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

// Orange Color with Opacity 20 - 80 %
Color orangeColor = getColorFromHex('#FE724C');
Color orangeColor80 = getColorFromHex('#FE8160');
Color orangeColor50 = getColorFromHex('#FEA58D');
Color orangeColor20 = getColorFromHex('#FED2C7');

// Yellow Color with Opacity 20 - 80 %
Color yellowColor = getColorFromHex('#FFC529');
Color yellowColor80 = getColorFromHex('#FFD050');
Color yellowColor50 = getColorFromHex('#FFDF8B');
Color yellowColor20 = getColorFromHex('#FFEFC3');

// Black Color with Opacity 20 - 80 %
Color blackColor = getColorFromHex('#1A1D26');
Color blackColor80 = getColorFromHex('#2A2F3D');
Color blackColor50 = getColorFromHex('#4D5364');
Color blackColor20 = getColorFromHex('#6E7489');

// Gray Color with Opacity 20 - 80 %
Color grayColor = getColorFromHex('#9A9FAE');
Color grayColor80 = getColorFromHex('#A8ACB9');
Color grayColor50 = getColorFromHex('#C4C7D0');
Color grayColor20 = getColorFromHex('#EBEBEB');

const Color whiteColor = Colors.white;

const String sofia = 'sofia';

TextTheme textTheme = const TextTheme(
  headlineMedium: TextStyle(
    fontFamily: sofia,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  ),
  headlineSmall: TextStyle(
    fontFamily: sofia,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  titleLarge: TextStyle(
    fontFamily: sofia,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  ),
  titleMedium: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  bodySmall: TextStyle(
    fontFamily: sofia,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  ),
  labelLarge: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.25,
  ),
);
