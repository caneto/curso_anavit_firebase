
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
