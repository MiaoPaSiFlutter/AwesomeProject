class User {
  String id;
  String? userName;
  String? photoUrl;
  bool active;
  DateTime? lastSeen;

  User({
    required this.id,
    this.userName,
    this.photoUrl,
    this.active = false,
    this.lastSeen,
  });

  toJson() => {
        'id': id,
        'user_name': userName,
        'photo_url': photoUrl,
        'active': active,
        'last_seen': lastSeen.toString()
      };
  getAvalUrl() {
    return photoUrl != null
        ? photoUrl
        : 'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
      id: json['id'],
      userName: json['user_name'],
      photoUrl: json['photo_url'],
      active: json['active'],
      lastSeen: json['last_seen'] != null
          ? DateTime.tryParse(json['last_seen'])
          : null,
    );
    return user;
  }

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
