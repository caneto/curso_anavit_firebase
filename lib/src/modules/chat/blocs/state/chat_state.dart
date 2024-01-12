
import '../../models/chat_model.dart';

class ChatState {
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
  const DataChatState(this.chat);

  final ChatModel chat;
}