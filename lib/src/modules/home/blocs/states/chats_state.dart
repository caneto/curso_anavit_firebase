import '../../models/chat_model.dart';

class ChatsState {
  const ChatsState({
    required this.searchedChats,
    required this.pinnedPrivateChats,
    required this.allPrivateChats,
    required this.pinnedGroupChats,
    required this.allGroupChats,
  });

  factory ChatsState.initState() {
    return const ChatsState(
      searchedChats: [],
      pinnedPrivateChats: [],
      allPrivateChats: [],
      pinnedGroupChats: [],
      allGroupChats: [],
    );
  }

  final List<ChatModel> searchedChats;
  final List<ChatModel> pinnedPrivateChats;
  final List<ChatModel> allPrivateChats;
  final List<ChatModel> pinnedGroupChats;
  final List<ChatModel> allGroupChats;

  ChatsState copyWith({
    List<ChatModel>? searchedChats,
    List<ChatModel>? pinnedPrivateChats,
    List<ChatModel>? allPrivateChats,
    List<ChatModel>? pinnedGroupChats,
    List<ChatModel>? allGroupChats,
  }) {
    return ChatsState(
      searchedChats: searchedChats ?? this.searchedChats,
      pinnedPrivateChats: pinnedPrivateChats ?? this.pinnedPrivateChats,
      allPrivateChats: allPrivateChats ?? this.allPrivateChats,
      pinnedGroupChats: pinnedGroupChats ?? this.pinnedGroupChats,
      allGroupChats: allGroupChats ?? this.allGroupChats,
    );
  }
}
