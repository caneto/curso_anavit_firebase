import '../../../core/shared/enums/chat_status.dart';
import '../../../core/shared/enums/user_status.dart';

class ChatModel {
  const ChatModel({
    required this.id,
    required this.name,
    required this.contacts,
    required this.imageUrl,
    required this.messageDate,
    required this.lastMessage,
    required this.unreadMessagesCount,
    required this.chatStatus,
    this.userStatus,
  });   

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      name: map['name'],
      contacts: Set<String>.from(map['contacts']),
      imageUrl: map['image_url'],
      messageDate: DateTime.fromMillisecondsSinceEpoch(map['message_date']),
      lastMessage: map['last_message'],
      unreadMessagesCount: map['unread_messages_count']?.toInt(),
      userStatus: map['user_status'] != null ? UserStatus.fromCode(map['user_status']) : null,
      chatStatus: ChatStatus.fromCode(map['chat_status']),
    );
  }

  final String id;
  final String name;
  final Set<String> contacts;
  final String imageUrl;
  final DateTime messageDate;
  final String lastMessage;
  final int unreadMessagesCount;
  final UserStatus? userStatus;
  final ChatStatus chatStatus;



}
