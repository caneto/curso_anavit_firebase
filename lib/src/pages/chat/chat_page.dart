import 'package:chat_firebase/src/pages/chat/widgets/chat_app_bar_widget.dart';
import 'package:chat_firebase/src/pages/chat/widgets/message_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return const Scaffold(
      appBar: ChatAppBarWidget(),
      body: Column(
        children: [
          MessageWidget.myMessage(),
          MessageWidget.otherMessage(
            userImage: 'https://avatars.githubusercontent.com/u/2157300?v=4',
            isOnline: true,
          ),
        ],
      ),
    );
  }
}
