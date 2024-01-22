import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/interfaces/i_chat_repository.dart';
import '../repository/interfaces/i_message_repository.dart';
import 'events/chat_event.dart';
import 'state/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._chatRepository,
    this._messageRepository,
  ) : super(ChatState.initialState()) {
    on<LoadChatEvent>(_load);
  }

  final IChatRepository _chatRepository;
  final IMessageRepository _messageRepository;

  Future<void> _load(LoadChatEvent event, Emitter<ChatState> emit) async {
    emit(const LoadingChatStatge());

    final chat = await _chatRepository.getByID(event.chatID);
    final messagesStream = _messageRepository.getMessages(chat.id);
    final messages = await messagesStream.first;
    
    final contacts = event.contacts.where((e) => chat.usersID.contains(e.id));

    emit(DataChatState(
      chat: chat,
      messages: messages,
      contacts: contacts.toSet(),
    ));
  }
}
