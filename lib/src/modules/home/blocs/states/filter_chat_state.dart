import '../../../../core/shared/enums/chat_type.dart';

class FilterChatState {
  const FilterChatState({
    this.chatType,
    this.searchedText,
  });

  factory FilterChatState.initState() {
    return const FilterChatState(chatType: ChatType.private);
  }

  final ChatType? chatType;
  final String? searchedText;

  bool get isFilteredByGroup => chatType == ChatType.group && searchedText == null;
  bool get isFilteredByPrivete => chatType == ChatType.private && searchedText == null;
    
  FilterChatState clearSearch() {
    return FilterChatState(
      chatType: chatType,
      searchedText: null,
    );
  }

  FilterChatState copyWith({
    ChatType? chatType,
    String? searchedText,
  }) {
    return FilterChatState(
      chatType: chatType ?? this.chatType,
      searchedText: searchedText ?? this.searchedText,
    );
  }
}
