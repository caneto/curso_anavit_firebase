import '../../../../core/shared/enums/chat_type.dart';
import '../../../../core/shared/enums/user_status.dart';
import '../../models/chat_model.dart';
import '../interfaces/i_chat_repository.dart';

class ChatRepository implements IChatRepository {
  @override
  Future<ChatModel> getByID(String id) async {
    if (id == 'CHAT-ID1') {
      return ChatModel(
        id: id,
        name: 'Privado',
        usersID: {'CONTACT-1'},
        userStatus: UserStatus.online,
        type: ChatType.private,
      );
    }
    return ChatModel(
        id: id,
        name: 'Group',
        usersID: {'CONTACT-1', 'CONTACT-2'},
        type: ChatType.group,
      );
  }
}
