
import '../../models/messages/message_model.dart';

abstract class IMessageRepository {
  Stream<List<MessageModel>> getMessages(String chatID);
}