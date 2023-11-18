import 'package:flutter/material.dart';

class InterestingUIModel {
  String title;
  String? description;
  String? date;
  String? url;
  String? author;
  List<String> tags;
  List<String>? gifOrPictures;
  Widget app;
  InterestingUIModel({
    required this.title,
    required this.tags,
    required this.app,
    this.description,
    this.date,
    this.url,
    this.author,
    this.gifOrPictures,
  });
}
