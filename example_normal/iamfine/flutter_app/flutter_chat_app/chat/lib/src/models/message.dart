class Message {
  final String id;
  final String? groupId;
  final String from;
  final String to;
  final DateTime timestamp;
  final String contents;

  Message({
    required this.id,
    this.groupId,
    required this.from,
    required this.to,
    required this.timestamp,
    required this.contents,
  });

  toJson() => {
        'from': from,
        'to': to,
        'timestamp': timestamp,
        'contents': contents,
        'group_id': groupId
      };

  factory Message.fromJson(Map<String, dynamic> json) {
    var message = Message(
        id: json['id'],
        from: json['from'],
        to: json['to'],
        contents: json['contents'],
        timestamp: json['timestamp'],
        groupId: json['group_id']);

    return message;
  }
}
