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
          builder: (_, ChatsState chatState) {
            List<ChatModel> pinnedChats = [];
            List<ChatModel> allChats = [];
            int pinnedAmount = 0;
            int allAmount = 0;

            if (filterState.isFilteredByPrivete) {
              pinnedAmount = chatState.unreadPinnedPrivateAmount;
              allAmount = chatState.unreadAllPrivateAmount;
              pinnedChats = chatState.pinnedPrivateChats;
              allChats = chatState.allPrivateChats;
            } else if (filterState.isFilteredByGroup) {
              pinnedAmount = chatState.unreadPinnedGroupAmount;
              allAmount = chatState.unreadAllGroupAmount;
              pinnedChats = chatState.pinnedGroupChats;
              allChats = chatState.allGroupChats;
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
