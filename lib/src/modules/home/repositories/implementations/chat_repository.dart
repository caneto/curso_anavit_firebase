import '../../../../core/shared/services/api/i_api_service.dart';
import '../../../../core/shared/services/api/params/filter_param.dart';
import '../../models/chat_model.dart';
import '../../models/contact_model.dart';
import '../interfaces/i_chat_repository.dart';

class ChatRepository implements IChatRepository {
  ChatRepository(this._apiService);

  final IApiService _apiService;

  @override
  Future<List<ChatModel>> getPrivateChats(
    String userID,
    List<ContactModel> contacts,
  ) async {
    final filterMyID = FilterParam.contains('contacts', userID);
    final filterPrivateChat = FilterParam.equal('type', 'private');

    final chats = await _apiService.get(
      'chats',
      filters: [filterMyID, filterPrivateChat],
    );

    final models = <ChatModel>[];

    for (final chat in chats) {
      final chatUsers = chat['users_id'] as List;
      final otherUserID = chatUsers.firstWhere((e) => e != userID);
      final contact = contacts.firstWhere((e) => e.id == otherUserID);

      final currentChatFilter = FilterParam.equal('chat_id', chat['id']);
      final lastMessages = await _apiService.get(
        'messages',
        filters: [currentChatFilter],
        orderBy: const OrderByParam(key: 'sended_at'),
      );
      final lastMessage = lastMessages.first;

      // TODO: Conectar com Firebase
      final unrealFilter = FilterParam.equal('unreal', true);
      final unreadMessagesCount = await _apiService.count(
        'messages',
        filters: [currentChatFilter, unrealFilter],
      );

      final data = {
        'id': chat['id'],
        'contacts': chat['users_id'],
        'chat_status': chat['chat_status'],
        'image_url': contact.imageUrl,
        'name': contact.fullName,
        'user_status': contact.status.code,
        'message_date': lastMessage['sended_at'],
        'last_message': lastMessage['contact'],
        'unread_messages_count': unreadMessagesCount,
      };

      final model = ChatModel.fromMap(data);
      models.add(model);
    }
    return models;
  }

  @override
  Future<List<ChatModel>> getGroupChats(String userID) {
    // TODO: implement getGroupChats
    throw UnimplementedError();
  }
}
