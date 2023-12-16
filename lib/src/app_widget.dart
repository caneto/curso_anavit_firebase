import 'package:chat_firebase/src/core/shared/themes/app_theme.dart';
import 'package:chat_firebase/src/pages/chat/chat_page.dart';
import 'package:chat_firebase/src/pages/home/home_page.dart';
import 'package:chat_firebase/src/modules/login/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/': (_) => const HomePage(),
        '/chat': (_) => const ChatPage(),
      },
    );
  }
}
