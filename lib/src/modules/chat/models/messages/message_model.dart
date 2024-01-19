import 'group_message_model.dart';
import 'private_message_model.dart';

abstract class MessageModel {
  const MessageModel({
    required this.id,
    required this.chatID,
    required this.contact,
    required this.imageUrl,
    required this.sendedAt,
    required this.senderID,
  });

  factory MessageModel.fromMap(Map<String, dynamic> data) {
    if (data.containsKey('viewed')) {
      return PrivateMessageModel.fromMap(data);
    } else {
      return GroupMessageModel.fromMap(data);
    }
  }

  final String id;
  final String chatID;
  final String contact;
  final Set<String> imageUrl;
  final DateTime sendedAt;
  final String senderID;
}
