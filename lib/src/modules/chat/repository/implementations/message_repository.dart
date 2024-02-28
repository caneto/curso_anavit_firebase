import '../../../../core/shared/services/api/i_api_service.dart';
import '../../../../core/shared/services/api/params/filter_param.dart';
import '../../models/messages/message_model.dart';
import '../interfaces/i_message_repository.dart';

class MessageRepository implements IMessageRepository {
  const MessageRepository(this._apiService);

  final IApiService _apiService;

  @override
  Stream<List<MessageModel>> getMessages(String chatID) {
    final chatIDFilter = FilterParam.equal('chat_id', chatID);
    final orderBy = OrderByParam(key: 'sended_at');
    final response = _apiService.snapshot(
      'messages',
      filters: [chatIDFilter],
      orderBy: orderBy,
    );

    final messages = response.map((streamEvent) {
      return streamEvent.map(MessageModel.fromMap).toList();
    });
    return messages;
  }
}
