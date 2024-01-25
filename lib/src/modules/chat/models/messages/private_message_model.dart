import 'message_model.dart';

class PrivateMessageModel extends MessageModel {
  const PrivateMessageModel({
    required super.id,
    required super.chatID,
    required super.contact,
    required super.imageUrl,
    required super.sendedAt,
    required super.senderID,
  });

  @override
  factory PrivateMessageModel.fromMap(Map<String, dynamic> data) {
    return PrivateMessageModel(
      id: data['id'],
      chatID: data['chat_id'],
      contact: data['content'],
      imageUrl: Set<String>.from(data['images_url']),
      sendedAt: DateTime.fromMillisecondsSinceEpoch(data['sended_at']),
      senderID: data['sender'],
    );
  }
}
