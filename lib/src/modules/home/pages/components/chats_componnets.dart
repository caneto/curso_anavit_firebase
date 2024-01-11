import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/chats_bloc.dart';
import '../../blocs/filter_chat_bloc.dart';
import '../../blocs/states/chats_state.dart';
import '../../blocs/states/filter_chat_state.dart';
import '../../models/chat_model.dart';
import 'chat_section_component.dart';

class ChatsComponnets extends StatelessWidget {
  const ChatsComponnets(
      {super.key, required this.filterBloc, required this.chatsBloc});

  final FilterChatBloc filterBloc;
  final ChatsBloc chatsBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: filterBloc,
      builder: (_, FilterChatState filterState) {
        return BlocBuilder(
          bloc: chatsBloc,
          builder: (_, ChatsState chatsState) {
            if (filterState.isFilteredByText) {
              return ListView(
                children: [
                  if (chatsState.searchedChats.isNotEmpty) ...{
                    const Center(
                      child: Text('Nenhuma conversa encontrada'),
                    )
                  } else ...{
                    ChatSectionComponent(
                      label: 'Searched',
                      chats: chatsState.searchedChats,
                    ),
                  }
                ],
              );
            }

            List<ChatModel> pinnedChats = [];
            List<ChatModel> allChats = [];
            int pinnedAmount = 0;
            int allAmount = 0;

            if (filterState.isFilteredByPrivete) {
              pinnedAmount = chatsState.unreadPinnedPrivateAmount;
              allAmount = chatsState.unreadAllPrivateAmount;
              pinnedChats = chatsState.pinnedPrivateChats;
              allChats = chatsState.allPrivateChats;
            } else if (filterState.isFilteredByGroup) {
              pinnedAmount = chatsState.unreadPinnedGroupAmount;
              allAmount = chatsState.unreadAllGroupAmount;
              pinnedChats = chatsState.pinnedGroupChats;
              allChats = chatsState.allGroupChats;
            }
            return ListView(
              children: [
                ChatSectionComponent(
                  label: 'Pinned Message($pinnedAmount)',
                  chats: pinnedChats,
                ),
                const SizedBox(height: 20),
                ChatSectionComponent(
                  label: 'All Message($allAmount)',
                  chats: allChats,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
