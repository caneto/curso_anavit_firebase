import '../../models/chat_model.dart';
import '../../../../core/contacts/models/contact_model.dart';

abstract class IChatRepository {
  Future<List<ChatModel>> getPrivateChats(String userID, List<ContactModel> contacts);
  Future<List<ChatModel>> getGroupChats(String userID);
}