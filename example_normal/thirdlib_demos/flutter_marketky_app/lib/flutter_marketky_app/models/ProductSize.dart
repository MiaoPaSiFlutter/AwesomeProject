class ProductSize {
  String? size;
  String? name;

  ProductSize({this.size, this.name});

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      name: json['name'],
      size: json['size'],
    );
  }
}
