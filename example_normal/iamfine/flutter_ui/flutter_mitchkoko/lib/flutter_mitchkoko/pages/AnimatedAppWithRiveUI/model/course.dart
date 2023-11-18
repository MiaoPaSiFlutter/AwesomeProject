import 'package:flutter/material.dart' show Color;

import '../helper/helper_index.dart';

class Course {
  final String title, description, iconSrc;
  final Color color;

  Course({
    required this.title,
    this.description = 'Build and animate an iOS app from scratch',
    this.iconSrc = '',
    this.color = const Color(0xFF7553F6),
  });
}

final List<Course> courses = [
  Course(
    title: "Animations in SwiftUI",
        iconSrc: Utils.assets("icons/ios.svg"),

  ),
  Course(
    title: "Animations in Flutter",
    iconSrc: Utils.assets("icons/code.svg"),
    color: const Color(0xFF80A4FF),
  ),
];

final List<Course> recentCourses = [
  Course(title: "State Machine"),
  Course(
    title: "Animated Menu",
    color: const Color(0xFF9CC5FF),
    iconSrc: Utils.assets("icons/code.svg"),
  ),
  Course(title: "Flutter with Rive"),
  Course(
    title: "Animated Menu",
    color: const Color(0xFF9CC5FF),
    iconSrc: Utils.assets("icons/code.svg"),
  ),
];
