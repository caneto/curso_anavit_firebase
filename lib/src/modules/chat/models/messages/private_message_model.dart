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
}
