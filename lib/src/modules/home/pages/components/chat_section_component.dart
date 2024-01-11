import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/chat_model.dart';
import '../widgets/chat_card_widget.dart';

class ChatSectionComponent extends StatelessWidget {
  const ChatSectionComponent({
    super.key,
    required this.label,
    required this.chats,
  });

  final String label;
  final List<ChatModel> chats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat.jm();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        ListView.separated(
          itemCount: chats.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            final chat = chats.elementAt(index);

            return ChatCardWidget(
              isOnline: chat.userStatus?.isOnline ?? true,
              userImage: chat.imageUrl,
              userName: chat.name,
              content: chat.lastMessage,
              hour: dateFormat.format(chat.messageDate),
              notificationAmount: chat.unreadMessagesCount,
              onTap: () {
                Navigator.of(context).pushNamed('/chat');
              },
            );
          },
        ),
      ],
    );
  }
}
