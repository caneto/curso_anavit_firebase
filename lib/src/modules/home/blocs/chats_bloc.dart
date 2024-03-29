import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/chat_model.dart';
import '../repositories/interfaces/i_chat_repository.dart';
import 'events/chats_event.dart';
import 'states/chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc(this._repository) : super(ChatsState.initState()) {
    on<SearchByTextChatsEvent>(_search);
    on<GetChatsEvent>(_get);
  }

  final IChatRepository _repository;

  Future<void> _search(
    SearchByTextChatsEvent event,
    Emitter<ChatsState> emit,
  ) async {
    final searchedText = event.searchedText.toLowerCase();
   

    final searchedChats = state.allChats.where((e) {
      return e.name.toLowerCase().contains(searchedText);
    });

    final newState = state.copyWith(searchedChats: searchedChats.toList());
    emit(newState);
  }

  Future<void> _get(
    GetChatsEvent event,
    Emitter<ChatsState> emit,
  ) async {
    final [privateChats, groupChats] = await Future.wait([
      _repository.getPrivateChats(event.userID, event.contacts),
      _repository.getGroupChats(event.userID)
    ]);

    final (pinnedPrivate, allPrivate) = _filterChats(privateChats);
    final (pinnedGroup, allGroup) = _filterChats(groupChats);

    final newState = state.copyWith(
      allPrivateChats: allPrivate,
      pinnedPrivateChats: pinnedPrivate,
      allGroupChats: allGroup,
      pinnedGroupChats: pinnedGroup,
    );

    emit(newState);
  }

  (List<ChatModel>, List<ChatModel>) _filterChats(List<ChatModel> chats) {
    final pinnedChats = <ChatModel>[];
    final allChats = <ChatModel>[];

    for (final chat in chats) {
      if (chat.chatStatus.isPinned) {
        pinnedChats.add(chat);
      } else {
        allChats.add(chat);
      }
    }

    return (pinnedChats, allChats);
  }
}
