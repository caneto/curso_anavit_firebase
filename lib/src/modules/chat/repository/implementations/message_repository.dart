import '../../models/messages/message_model.dart';
import '../interfaces/i_message_repository.dart';

class MessageRepository implements IMessageRepository {
  @override
  Stream<List<MessageModel>> getMessages(String chatID) {
    final data = [
      <String, dynamic>{
        'id': 'MESSAGE-ID',
        'chat_id': 'CHAT-ID',
        'content': 'Contato mensagem',
        'images_url': [],
        'sended_at': DateTime.now().millisecondsSinceEpoch,
        'sender': 'CONTACT-1',
        'viewed': true,
      },
      <String, dynamic>{
        'id': 'MESSAGE-ID',
        'chat_id': 'CHAT-ID',
        'content': 'Contato mensagem',
        'images_url': [],
        'sended_at': DateTime.now().millisecondsSinceEpoch,
        'sender': 'USER-ID',
        'viewed': true,
      },
    ];

    final messages = data.map(MessageModel.fromMap).toList();
    return Stream.value(messages);
  }
}
