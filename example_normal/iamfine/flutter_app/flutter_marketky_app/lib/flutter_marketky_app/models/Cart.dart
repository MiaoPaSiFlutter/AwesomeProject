class Cart {
  List<String>? image;
  String? name;
  int? price;
  int? count;

  Cart({
    this.image,
    this.name,
    this.price,
    this.count,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      image: json['image'],
      name: json['name'],
      price: json['price'],
      count: json['count'],
    );
  }
}
