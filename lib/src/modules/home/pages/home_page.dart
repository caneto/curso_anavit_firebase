import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/user/blocs/events/user_event.dart';
import '../../../core/user/blocs/user_bloc.dart';
import '../blocs/chats_bloc.dart';
import '../../../core/contacts/blocs/contacts_bloc.dart';
import '../blocs/events/chats_event.dart';
import '../../../core/contacts/blocs/events/contacts_event.dart';
import '../blocs/filter_chat_bloc.dart';
import '../blocs/states/chats_state.dart';
import '../../../core/contacts/blocs/state/contacts_state.dart';
import 'components/chats_componnets.dart';
import 'components/contacts_components.dart';
import 'components/filter_bar_components.dart';
import 'components/chat_section_component.dart';
import 'widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.userBloc,
    required this.contactsBloc,
    required this.filterChatBloc,
    required this.chatsBloc,
  });

  final UserBloc userBloc;
  final ContactsBloc contactsBloc;
  final FilterChatBloc filterChatBloc;
  final ChatsBloc chatsBloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final StreamSubscription contactSubscription;

  @override
  void initState() {
    super.initState();

    final user = widget.userBloc.user;

    contactSubscription = widget.contactsBloc.stream.listen((state) {
      if (state is DataContactsState) {
        final contacts = state.contacts;
        final event = GetChatsEvent(contacts: contacts, userID: user.id);
        widget.chatsBloc.add(event);
      }
    });

    widget.filterChatBloc.stream.listen((state) {
      final searchedText = state.searchedText;

      if(searchedText != null && searchedText.isNotEmpty) {
        widget.chatsBloc.add(SearchByTextChatsEvent(searchedText));
      }
    });

    widget.contactsBloc.add(LoadContactsEvent(user.contacts));
  }

  @override
  void dispose() {
    contactSubscription.cancel();
    super.dispose();
  }

  void logout() {
    widget.userBloc.add(LogoutUserEvent());
    Modular.to.pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: BlocBuilder(
                bloc: widget.chatsBloc,
                builder: (_, ChatsState state) {
                  return HomeAppBarWidget(
                    userName: widget.userBloc.user.firstName,
                    unreadChatCount: state.unreadChetsAmount,
                    onLogoutTap: logout,
                  );
                },
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 16),
                child: ContactsComponent(
                  contactsBloc: widget.contactsBloc,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    FilterBarComponent(
                      filterChatBloc: widget.filterChatBloc,
                      chatsBloc: widget.chatsBloc,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ChatsComponnets(
                        filterBloc: widget.filterChatBloc,
                        chatsBloc: widget.chatsBloc,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
