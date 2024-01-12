
class ChatEvent {
  const ChatEvent();
}

class LoadByIDChatEvent extends ChatEvent {
  const LoadByIDChatEvent(this.chatID);

  final String chatID;
}