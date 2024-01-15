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
}
