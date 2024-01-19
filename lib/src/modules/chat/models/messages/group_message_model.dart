import 'message_model.dart';

class GroupMessageModel extends MessageModel {
  const GroupMessageModel({
    required super.id,
    required super.chatID,
    required super.contact,
    required super.imageUrl,
    required super.sendedAt,
    required super.senderID,
  });

  factory GroupMessageModel.fromMap(Map<String, dynamic> data) {
    return GroupMessageModel(
      id: data['id'],
      chatID: data['chat_id'],
      contact: data['content'],
      imageUrl: Set<String>.from(data['images_url']),
      sendedAt: DateTime.fromMillisecondsSinceEpoch(data['sender_at']),
      senderID: data['sender'],
    );
  }
}
