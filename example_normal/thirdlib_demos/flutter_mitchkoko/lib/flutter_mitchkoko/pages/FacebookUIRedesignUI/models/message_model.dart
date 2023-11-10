import 'package:flutter/material.dart';

import '../helper/helper_index.dart';

class MessageModel {
  final String name;
  final String time;
  final String avatar;
  final Icon status;

  MessageModel({
    required this.name,
    required this.time,
    required this.avatar,
    required this.status,
  });

  static Icon statusOnline = const Icon(
    Icons.phone_android_outlined,
    size: 18,
    color: Colors.green,
  );
  static Icon statusOffline = const Icon(
    Icons.phone_android_outlined,
    size: 18,
    color: Colors.black38,
  );
}

List<MessageModel> messageData = [
  MessageModel(
    name: "Rahul",
    avatar: Utils.assets("images/user/u1.jpg"),
    time: "10:20",
    status: MessageModel.statusOnline,
  ),
  MessageModel(
    name: "Ranjan",
    avatar: Utils.assets("images/user/u3.jpg"),
    time: "14:23",
    status: MessageModel.statusOffline,
  ),
  MessageModel(
    name: "Vikash",
    avatar: Utils.assets("images/user/u6.jpg"),
    time: "23:20",
    status: MessageModel.statusOnline,
  ),
  MessageModel(
    name: "Khushi",
    avatar: Utils.assets("images/user/u9.jpg"),
    time: "22:30",
    status: MessageModel.statusOffline,
  ),
  MessageModel(
    name: "Sameer",
    avatar: Utils.assets("images/user/u10.jpg"),
    time: "22:30",
    status: MessageModel.statusOnline,
  ),
  MessageModel(
    name: "Emma",
    avatar: Utils.assets("images/user/u5.jpg"),
    time: "22:30",
    status: MessageModel.statusOffline,
  ),
  MessageModel(
    name: "Kethy",
    avatar: Utils.assets("images/user/u4.jpg"),
    time: "22:30",
    status: MessageModel.statusOffline,
  ),
  MessageModel(
    name: "Jaya",
    avatar: Utils.assets("images/user/u9.jpg"),
    time: "22:30",
    status: MessageModel.statusOnline,
  ),
  MessageModel(
    name: "Sahil",
    avatar: Utils.assets("images/user/u10.jpg"),
    time: "22:30",
    status: MessageModel.statusOffline,
  ),
  MessageModel(
    name: "Diti",
    avatar: Utils.assets("images/user/u5.jpg"),
    time: "22:30",
    status: MessageModel.statusOnline,
  ),
  MessageModel(
    name: "Vidhi",
    avatar: Utils.assets("images/user/u4.jpg"),
    time: "22:30",
    status: MessageModel.statusOffline,
  ),
];
