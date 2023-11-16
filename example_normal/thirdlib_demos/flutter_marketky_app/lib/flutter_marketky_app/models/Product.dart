import 'ColorWay.dart';
import 'ProductSize.dart';
import 'Review.dart';

class Product {
  List<String>? image;
  String? name;
  int? price;
  double? rating;
  String? description;
  List<ColorWay>? colors;
  List<ProductSize>? sizes;
  List<Review>? reviews;
  String? storeName;

  Product({
    this.image,
    this.name,
    this.price,
    this.rating,
    this.description,
    this.colors,
    this.sizes,
    this.reviews,
    this.storeName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      return Product(
        image: json['image'],
        name: json['name'],
        price: json['price'],
        rating: json['rating'],
        description: json['description'],
        colors: (json['colors'] as List)
            .map((data) => ColorWay.fromJson(data))
            .toList(),
        sizes: (json['sizes'] as List)
            .map((data) => ProductSize.fromJson(data))
            .toList(),
        reviews: (json['reviews'] as List)
            .map((data) => Review.fromJson(data))
            .toList(),
        storeName: json['store_name'],
      );
    } catch (e) {
      print(e);
      return Product();
    }
  }
}
