import 'package:chat_firebase/src/pages/chat/widgets/chat_app_bar_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const ChatAppBarWidget(),
      body: Container(),
    );
  }
}
