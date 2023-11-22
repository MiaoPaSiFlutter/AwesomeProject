class MessageGroup {
  String? _id;
  String? get id => _id;
  String? name;
  String? createdBy;
  List<String> members;

  MessageGroup({
    required this.createdBy,
    required this.name,
    required this.members,
  });

  toJson() => {
        'created_by': createdBy,
        'name': name,
        'members': members,
      };
  factory MessageGroup.fromJson(Map<String, dynamic> json) {
    var group = MessageGroup(
        createdBy: json['created_by'],
        name: json['name'],
        members: List<String>.from(json['members']));
    group._id = json['id'];
    return group;
  }
}
