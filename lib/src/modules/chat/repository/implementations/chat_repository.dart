import '../../../../core/shared/services/api/i_api_service.dart';
import '../../models/chat_model.dart';
import '../interfaces/i_chat_repository.dart';

class ChatRepository implements IChatRepository {
  
  const ChatRepository(this._apiService);

  final IApiService _apiService;

  @override
  Future<ChatModel> getByID(String id) async {
    final response = await _apiService.getByID('chats', id);
    
    final chat = ChatModel.fromMap(response);

    return chat;    

    /* if (id == 'CHAT-ID1') {
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
      );*/
  } 
}
