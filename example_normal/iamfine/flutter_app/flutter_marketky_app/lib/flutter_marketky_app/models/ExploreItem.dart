class ExploreItem {
  final String? imageUrl;

  ExploreItem({this.imageUrl});

  factory ExploreItem.fromJson(Map<String, dynamic> json) {
    return ExploreItem(imageUrl: json['image_url']);
  }
}
