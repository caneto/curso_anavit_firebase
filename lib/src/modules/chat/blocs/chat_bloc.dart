import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/interfaces/i_chat_repository.dart';
import 'events/chat_event.dart';
import 'state/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this._repository) : super(ChatState.initialState()) {
    on<LoadChatEvent>(_load);
  }

  final IChatRepository _repository;

  Future<void> _load(LoadChatEvent event, Emitter<ChatState> emit) async {
    emit(const LoadingChatStatge());

    final chat = await _repository.getByID(event.chatID);

    final contacts = event.contacts.where((e) => chat.usersID.contains(e.id));

    emit(DataChatState(
      chat: chat,
      messages: [],
      contacts: contacts.toSet(),
    ));
  }
}
