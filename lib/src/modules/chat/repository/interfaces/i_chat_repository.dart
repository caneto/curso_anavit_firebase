
import '../../models/chat_model.dart';

abstract class IChatRepository {
  Future<ChatModel> getByID(String id);
}