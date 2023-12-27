import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/user/blocs/events/user_event.dart';
import '../../core/user/blocs/user_bloc.dart';
import 'widgets/chat_section_widget.dart';
import 'widgets/contacts_widget.dart';
import 'widgets/filter_bar_widget.dart';
import 'widgets/home_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.userBloc,
  });

  final UserBloc userBloc;
  
  void logout() {
    userBloc.add(LogoutUserEvent());
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
              child: HomeAppBarWidget(
                userName: 'Carlos',
                unreadChatCount: 48,
                onLogoutTap: logout,
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 16),
                child: ContactsWidget(),
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
                    const FilterBarWidget(),
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
