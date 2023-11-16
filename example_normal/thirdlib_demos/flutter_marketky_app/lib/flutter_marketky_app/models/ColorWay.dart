import 'package:flutter/material.dart';

class ColorWay {
  String? name;
  Color? color;

  ColorWay({this.name, this.color});

  factory ColorWay.fromJson(Map<String, dynamic> json) {
    return ColorWay(name: json['name'], color: json['color']);
  }
}
