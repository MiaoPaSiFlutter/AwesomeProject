import 'package:flutter/material.dart';

import '../helper/helper_index.dart';

class StoryModel {
  final VoidCallback onTap;
  final String image;
  final String userName;

  StoryModel({
    required this.onTap,
    required this.image,
    required this.userName,
  });
}

List<StoryModel> storyData = [
  StoryModel(
    userName: "Priti",
    image: Utils.assets("images/story/s1.jpg"),
    onTap: () => {print('Priti Story Clicked')},
  ),
  StoryModel(
    userName: "Sonali",
    image: Utils.assets("images/story/s2.jpg"),
    onTap: () => {print('Sonali Story Clicked')},
  ),
  StoryModel(
    userName: "Sejal",
    image: Utils.assets("images/story/s3.jpg"),
    onTap: () => {print('Sejal Story Clicked')},
  ),
  StoryModel(
    userName: "Jack",
    image: Utils.assets("images/story/s4.jpg"),
    onTap: () => {print('Jack Story Clicked')},
  ),
  StoryModel(
    userName: "Pragati",
    image: Utils.assets("images/story/s5.jpg"),
    onTap: () => {print('Pragati Story Clicked')},
  ),
];
