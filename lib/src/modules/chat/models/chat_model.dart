import '../../../core/shared/enums/chat_type.dart';
import '../../../core/shared/enums/user_status.dart';

class ChatModel {
  const ChatModel({
    required this.id,
    required this.name,
    required this.usersID,
    required this.type,
    this.userStatus,
  });

  final String id;
  final String name;
  final Set<String> usersID;
   final UserStatus? userStatus;
  final ChatType type;
}
