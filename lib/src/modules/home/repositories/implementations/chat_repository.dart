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
    final chats = await _getChat(currentUserID: userID, isPrivateChat: true);

    final models = <ChatModel>[];

    for (final chat in chats) {
      final chatID = chat['id'];
      final chatUsers = List<String>.from(chat['users_id']);
      final otherUserID = chatUsers.firstWhere((e) => e != userID);
      final contact = contacts.firstWhere((e) => e.id == otherUserID);

      final lastMessage = await _getLastMessageByChatID(chatID);
      final unreadMessagesCount = await _getUnreadePrivateMessagesAmount(
          chatID: chatID, otherUserID: otherUserID);

      // TODO: Conectar com Firebase

      final data = {
        'id': chatID,
        'contacts': chat['users_id'],
        'chat_status': chat['chat_status'],
        'image_url': contact.imageUrl,
        'name': contact.fullName,
        'user_status': contact.status.code,
        'message_date': lastMessage['sended_at'],
        'last_message': lastMessage['contact'],
        'unread_messages_count': unreadMessagesCount,
      };

      models.add(ChatModel.fromMap(data));
    }
    return models;
  }

  @override
  Future<List<ChatModel>> getGroupChats(String userID) async {
    final chats = await _getChat(currentUserID: userID, isPrivateChat: false);

    final models = <ChatModel>[];

    for (final chat in chats) {
      final chatID = chat['id'];

      final lastMessage = await _getLastMessageByChatID(chatID);
      final unreadMessagesCount = await _getUnreadeGroupMessagesAmount(
        chatID: chatID,
        currentUserID: userID,
      );

      // TODO: Conectar com Firebase

      final data = {
        'id': chatID,
        'contacts': chat['users_id'],
        'chat_status': chat['chat_status'],
        'image_url': chat['image_url'],
        'name': chat['name'],
        'user_status': null,
        'message_date': lastMessage['sended_at'],
        'last_message': lastMessage['contact'],
        'unread_messages_count': unreadMessagesCount,
      };

      models.add(ChatModel.fromMap(data));
    }

    return models;
  }

  Future<List<Map<String, dynamic>>> _getChat({
    required String currentUserID,
    required bool isPrivateChat,
  }) async {
    final currrentUserFilter = FilterParam.contains('contacts', currentUserID);
    final chatType = isPrivateChat ? 'private' : 'group';
    final chatFilterType = FilterParam.equal('type', chatType);

    final chatData = await _apiService
        .get('chats', filters: [currrentUserFilter, chatFilterType]);

    return chatData;
  }

  Future<Map<String, dynamic>> _getLastMessageByChatID(String chatID) async {
    final currentChatFilter = FilterParam.equal('chat_id', chatID);
    final lastMessages = await _apiService.get(
      'messages',
      filters: [currentChatFilter],
      orderBy: const OrderByParam(key: 'sended_at'),
      limit: 1,
    );
    final lastMessage = lastMessages.first;

    return lastMessage;
  }

  Future<int> _getUnreadePrivateMessagesAmount({
    required chatID,
    required otherUserID,
  }) async {
    final currentChatFilter = FilterParam.equal('chat_id', chatID);
    final unrealFilter = FilterParam.equal('viewed', false);
    final senderFilter = FilterParam.equal('sender', otherUserID);
    final unreadMessagesCount = await _apiService.count(
      'messages',
      filters: [currentChatFilter, unrealFilter, senderFilter],
    );

    return unreadMessagesCount;
  }

  Future<int> _getUnreadeGroupMessagesAmount(
      {required chatID, required currentUserID}) async {
    final currentChatFilter = FilterParam.equal('chat_id', chatID);
    final unrealFilter = FilterParam.contains('not_viewed_by', currentUserID);
    final unreadMessagesCount = await _apiService.count(
      'messages',
      filters: [currentChatFilter, unrealFilter],
    );

    return unreadMessagesCount;
  }
}
