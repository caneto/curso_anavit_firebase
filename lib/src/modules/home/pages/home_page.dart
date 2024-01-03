import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/user/blocs/events/user_event.dart';
import '../../../core/user/blocs/user_bloc.dart';
import '../blocs/contacts_bloc.dart';
import '../blocs/events/contacts_event.dart';
import '../blocs/filter_chat_bloc.dart';
import 'components/contacts_components.dart';
import 'components/filter_bar_components.dart';
import 'widgets/chat_section_widget.dart';
import 'widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.userBloc,
    required this.contactsBloc,
    required this.filterChatBloc,
  });

  final UserBloc userBloc;
  final ContactsBloc contactsBloc;
  final FilterChatBloc filterChatBloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    widget.contactsBloc.add(LoadContactsEvent(widget.userBloc.user.contacts));
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
                bloc: widget.userBloc,
                builder: (_, __) {
                  return HomeAppBarWidget(
                    userName: widget.userBloc.user.firstName,
                    unreadChatCount: 48,
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
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView(
                        children: const [
                          ChatSectionWidget(label: 'Pinned Message(2)'),
                          SizedBox(height: 20),
                          ChatSectionWidget(label: 'All Message(7)'),
                        ],
                      ),
                    ),
                    //Expanded(
                    //  child: Column(
                    //    children: [
                    //    ],
                    //  )
                    //)
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
