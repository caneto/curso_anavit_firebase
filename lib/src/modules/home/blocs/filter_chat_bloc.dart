import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/filter_chat_event.dart';
import 'states/filter_chat_state.dart';


class FilterChatBloc extends Bloc<FilterChatEvent, FilterChatState> {
  FilterChatBloc() : super(FilterChatState.initState()) {
    on<SearchFilterChatEvent>(_search);
    on<ClearSearchFilterChatEvent>((_, emit) => _clearSearch(emit));
    on<ChangeTypeFilterChatEvent>(_changeType);
  }

  void _search(
    SearchFilterChatEvent event,
    Emitter<FilterChatState> emit,
  ) async {
    emit(state.copyWith(searchedText: event.searchedText));
  }

  void _clearSearch(
    Emitter<FilterChatState> emit,
  ) async {
    emit(state.clearSearch());
  }

  void _changeType(
    ChangeTypeFilterChatEvent event,
    Emitter<FilterChatState> emit,
  ) async {
    emit(FilterChatState(chatType: event.filter));
  }


}
