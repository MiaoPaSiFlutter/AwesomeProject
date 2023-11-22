import 'package:chat/chat.dart';

class LocalMessage {
  String get id => _id;
  late String _id;
  String chatId;
  Message message;
  ReceiptStatus receipt;

  LocalMessage({
    required this.chatId,
    required this.message,
    required this.receipt,
  });

  Map<String, dynamic> toMap() => {
        'chat_id': chatId,
        'id': message.id,
        'sender': message.from,
        'receiver': message.to,
        'contents': message.contents,
        'receipt': receipt.value(),
        'received_at': message.timestamp.toString()
      };

  factory LocalMessage.fromMap(Map<String, dynamic> json) {
    final message = Message(
        id: json['id'],
        groupId: json['group_id'],
        from: json['sender'],
        to: json['receiver'],
        contents: json['contents'],
        timestamp: DateTime.parse(json['received_at']));

    final localMessage = LocalMessage(
      chatId: json['chat_id'],
      message: message,
      receipt: EnumParsing.fromString(json['receipt']),
    );
    localMessage._id = json['id'];
    return localMessage;
  }
}
