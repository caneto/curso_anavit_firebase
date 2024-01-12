
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/interfaces/i_chat_repository.dart';
import 'events/chat_event.dart';
import 'state/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this._repository) : super(ChatState.initialState()){
    on<LoadByIDChatEvent>(_load);
  }

  final IChatRepository _repository;

  Future<void> _load(LoadByIDChatEvent event, Emitter<ChatState> emit) async {
    emit(const LoadingChatStatge());

    final chat = await _repository.getByID(event.chatID);

    emit(DataChatState(chat));
  }
  
}