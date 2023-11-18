class UserNotification {
  String? imageUrl;
  String? title;
  String? description;
  DateTime? dateTime;

  UserNotification({
    this.imageUrl,
    this.title,
    this.description,
    this.dateTime,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) {
    return UserNotification(
      imageUrl: json['image_url'],
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.tryParse(json['date_time']),
    );
  }
}
