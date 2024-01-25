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

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    final type = ChatType.values.byName(map['type']);

    return ChatModel(
      id: map['id'],
      name: map['name'],
      usersID: Set<String>.from(map['users_id']),
      userStatus: type == ChatType.private ? UserStatus.online: null,
      type: type,
    );
  }

  final String id;
  final String name;
  final Set<String> usersID;
  final UserStatus? userStatus;
  final ChatType type;

}
