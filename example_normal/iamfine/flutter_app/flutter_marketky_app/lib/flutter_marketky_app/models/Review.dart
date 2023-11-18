class Review {
  String? photoUrl;
  String? name;
  String? review;
  double? rating;

  Review({this.photoUrl, this.name, this.review, this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        photoUrl: json['photo_url'],
        name: json['name'],
        review: json['review'],
        rating: json['rating']);
  }
}
