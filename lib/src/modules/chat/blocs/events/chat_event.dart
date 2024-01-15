import '../../../../core/contacts/models/contact_model.dart';

class ChatEvent {
  const ChatEvent();
}

class LoadChatEvent extends ChatEvent {
  const LoadChatEvent({
    required this.chatID,
    required this.contacts,
  });

  final String chatID;
  final List<ContactModel> contacts;
}
