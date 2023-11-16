
class Category {
  String? iconUrl;
  String? name;
  bool? featured;
  Category({
     this.name,
     this.iconUrl,
     this.featured,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      featured: json['featured'],
      iconUrl: json['icon_url'],
      name: json['name'],
    );
  }
}
