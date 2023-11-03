import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_mitchkoko/flutter_mitchkoko/pages/AnimatedTravelAppUI/helper/helper_index.dart';

// ! Routing
int currentIndex = 0;
// ! Routing

List bottomBar = [
  const Icon(
    Ionicons.home_outline,
    color: Colors.white,
  ),
  const Icon(
    Ionicons.compass_outline,
    color: Colors.white,
  ),
  const Icon(
    Ionicons.bookmark_outline,
    color: Colors.white,
  ),
  const Icon(
    Ionicons.person_outline,
    color: Colors.white,
  ),
];

List data = [
  {
    "city": 'Nassau',
    "country": 'Bahamas',
    "rating": '4.6',
    'image': Utils.assets('images/nassau.jpg')
  },
  {
    "city": 'Mykonos',
    "country": 'Greece',
    "rating": '4.8',
    'image': Utils.assets('images/mykonos.jpg')
  },
  {
    "city": 'Colosseum',
    "country": 'Rome',
    "rating": '4.4',
    'image': Utils.assets('images/rome.jpg')
  },
  {
    "city": 'London',
    "country": 'England',
    "rating": '4.5',
    'image': Utils.assets('images/london.jpg')
  },
];
List data_2 = [
  {"name": 'Flaye', 'image': Utils.assets('images/flaye.png')},
  {"name": 'Beach', 'image': Utils.assets('images/beach.png')},
  {"name": 'Park', 'image': Utils.assets('images/park.png')},
  {"name": 'Camp', 'image': Utils.assets('images/camp.png')},
  {"name": 'Flaye', 'image': Utils.assets('images/flaye.png')},
  {"name": 'Beach', 'image': Utils.assets('images/beach.png')},
  {"name": 'Park', 'image': Utils.assets('images/park.png')},
  {"name": 'Camp', 'image': Utils.assets('images/camp.png')},
];
final categoryList = ['Populare', 'Recommended', 'Most Viewd', 'Most Liked'];

// Colors
const kAvatarColor = Color(0xffffdbc9);
const kPrimaryColor = Color(0xFFEEF7FF);
const kSecondaryColor = Color(0xFF29303D);
