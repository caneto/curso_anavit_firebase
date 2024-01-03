import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/enums/chat_type.dart';
import '../../blocs/events/filter_chat_event.dart';
import '../../blocs/filter_chat_bloc.dart';
import '../../blocs/states/filter_chat_state.dart';
import '../widgets/filter_card_widget.dart';
import '../widgets/search_filter_widget.dart';

class FilterBarComponent extends StatelessWidget {
  const FilterBarComponent({
    super.key,
    required this.filterChatBloc,
  });

  final FilterChatBloc filterChatBloc;

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
                notificationAmount: 32,
                isSelected: state.isFilteredByPrivete,
                onTap: () => changeFilter(ChatType.private),
              ),
              const SizedBox(height: 12),
              FilterCardWidget(
                label: 'Gruop',
                notificationAmount: 3,
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
