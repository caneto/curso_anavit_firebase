
import '../../../../core/shared/enums/chat_type.dart';

class FilterChatEvent {
  const FilterChatEvent();
}

class SearchFilterChatEvent extends FilterChatEvent {
  const SearchFilterChatEvent(this.searchedText);
  final String searchedText;
}

class ClearSearchFilterChatEvent extends FilterChatEvent {
  const ClearSearchFilterChatEvent();
}

class ChangeTypeFilterChatEvent extends FilterChatEvent {
  const ChangeTypeFilterChatEvent(this.filter);

  final ChatType filter;
}