import 'package:flutter/material.dart';

class SearchValue {
  final String value;

  SearchValue(this.value);
}

class RestaurantDetails {
  final String imagePath;
  final String restaurantName;
  final String restaurantAddress;
  final String category;
  final String distance;
  final String rating;

  RestaurantDetails({
    required this.imagePath,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.category,
    required this.distance,
    required this.rating,
  });
}

class CurrentScreen {
  final Widget currentScreen;
  final int tabNum;

  CurrentScreen({
    required this.tabNum,
    required this.currentScreen,
  });
}
