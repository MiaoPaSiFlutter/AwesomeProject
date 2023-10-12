/*
 * @Descripttion: 
 * @version: 
 * @Author: TT
 * @Date: 2023-05-15 14:37:17
 * @LastEditors: TT
 * @LastEditTime: 2023-05-15 14:37:18
 */
import 'dart:convert';

class ImageListModel {
  ImageListModel({
    this.total,
    this.list,
  });

  int? total;
  List<ImageModel>? list = [];

  factory ImageListModel.fromRawJson(String str) =>
      ImageListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageListModel.fromJson(Map<String, dynamic> json) => ImageListModel(
        total: json["total"],
        list: List<ImageModel>.from(
            json["list"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    this.id,
    this.title,
    this.url,
    this.type,
  });

  int? id;
  String? title;
  String? url;
  String? type;

  factory ImageModel.fromRawJson(String str) =>
      ImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "type": type,
      };
}
