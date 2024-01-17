import '../../../../core/contacts/models/contact_model.dart';
import '../../models/chat_model.dart';
import '../../models/messages/message_model.dart';

sealed class ChatState {
  const ChatState();

  factory ChatState.initialState() {
    return const InitialChatState();
  }
}

class InitialChatState extends ChatState {
  const InitialChatState();
}

class LoadingChatStatge extends ChatState {
  const LoadingChatStatge();
}

class DataChatState extends ChatState {
  const DataChatState({
    required this.chat,
    required this.messages,
    required this.contacts,
  });

  final ChatModel chat;
  final List<MessageModel> messages;
  final Set<ContactModel> contacts;
  
  bool isMyMessage(MessageModel message, String userID) {
    return message.senderID == userID;
  }

  ContactModel getContact(String senderID) {
    return contacts.firstWhere((e) =>  e.id == senderID);
  }
}
