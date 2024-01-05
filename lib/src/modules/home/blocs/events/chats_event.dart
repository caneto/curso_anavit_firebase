import '../../../../core/shared/enums/chat_status.dart';
import '../../models/contact_model.dart';

class ChatsEvent {
  const ChatsEvent();
}

class SearchByTextChatsEvent extends ChatsEvent {
  const SearchByTextChatsEvent(this.searchedText);

  final String searchedText;
}

class FilterByChatStatusChatsEvent extends ChatsEvent {
  const FilterByChatStatusChatsEvent(this.chatStatus);

  final ChatStatus chatStatus;
}

class GetChatsEvent extends ChatsEvent {
  const GetChatsEvent({
    required this.contacts,
    required this.userID,
  });

  final String userID;
  final List<ContactModel> contacts;
}
