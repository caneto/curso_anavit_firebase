import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/enums/chat_type.dart';
import '../../blocs/chats_bloc.dart';
import '../../blocs/events/filter_chat_event.dart';
import '../../blocs/filter_chat_bloc.dart';
import '../../blocs/states/filter_chat_state.dart';
import '../widgets/filter_card_widget.dart';
import '../widgets/search_filter_widget.dart';

class FilterBarComponent extends StatelessWidget {
  const FilterBarComponent({
    super.key,
    required this.filterChatBloc,
    required this.chatsBloc,
  });

  final FilterChatBloc filterChatBloc;
  final ChatsBloc chatsBloc;

  void changeFilter(ChatType type) {
    filterChatBloc.add(ChangeTypeFilterChatEvent(type));
  }

  void search(String searchedText) {
    filterChatBloc.add(SearchFilterChatEvent(searchedText));
  }

  void clearSearch() {
    filterChatBloc.add(const ClearSearchFilterChatEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: filterChatBloc,
      builder: (_, FilterChatState state) {
        return SearchFilterWidget(
          onSearch: search,
          onClose: clearSearch,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterCardWidget(
                label: 'Privated Message',
                notificationAmount: chatsBloc.state.unreadPrivateAmount,
                isSelected: state.isFilteredByPrivete,
                onTap: () => changeFilter(ChatType.private),
              ),
              const SizedBox(height: 12),
              FilterCardWidget(
                label: 'Gruop',
                notificationAmount: chatsBloc.state.unreadGroupAmount,
                isSelected: state.isFilteredByGroup,
                onTap: () => changeFilter(ChatType.group),
              ),
            ],
          ),
        );
      },
    );
  }
}
