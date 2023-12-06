import 'package:chat_firebase/src/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: HomeAppBarWidget(
            userName: 'Carlos',
            unreadChatCount: 48,
            onLogoutTap: logout,
          ),
        ),
      ),
    );
  }
}
