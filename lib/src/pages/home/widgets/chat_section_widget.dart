import 'package:chat_firebase/src/pages/home/widgets/chat_card_widget.dart';
import 'package:flutter/material.dart';

class ChatSectionWidget extends StatelessWidget {
  const ChatSectionWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            return ChatCardWidget(
              isOnline: index.isOdd,
              userImage:
                  'https://avatars.githubusercontent.com/u/2157300?v=4',
              userName: 'Carlos Alberto $index',
              content: 'Content $index',
              hour: '12:30 pm',
            );
          },
        ),
      ],
    );
  }
}
