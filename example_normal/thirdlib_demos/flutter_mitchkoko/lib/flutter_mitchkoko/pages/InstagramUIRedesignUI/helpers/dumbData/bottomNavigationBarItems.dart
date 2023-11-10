import 'package:flutter/material.dart';

import '../utils.dart';

List<Map> bottomNavigationItems = [
  {
    "label": "Home",
    "svgPath": Utils.assets('icons/home.svg'),
    "semanticLabel": "home icon",
    "color": null,
  },
  {
    "label": "Search",
    "svgPath": Utils.assets("icons/search.svg"),
    "semanticLabel": "search icon",
    "color": null,
  },
  {
    "label": "just for taking extra space",
    "svgPath": Utils.assets("icons/bar_heart.svg"),
    "semanticLabel": "just for taking extra space",
    "color": Colors.transparent,
  },
  {
    "label": "heart",
    "svgPath": Utils.assets("icons/bar_heart.svg"),
    "semanticLabel": "heart icon",
    "color": null,
  },
  {
    "label": "profile image",
    "profileImg": Utils.assets("images/add_story_item_profile.png"),
    "semanticLabel": "heart icon",
    "radius": 14.0,
  }
];
