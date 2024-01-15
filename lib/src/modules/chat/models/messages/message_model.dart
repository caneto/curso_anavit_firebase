
class MessageModel {
  const MessageModel({
    required this.id,
    required this.chatID,
    required this.contact,
    required this.imageUrl,
    required this.sendedAt,
    required this.senderID,
  });

  final String id;
  final String chatID;
  final String contact;
  final Set<String> imageUrl;
  final DateTime sendedAt;
  final String senderID;
}
