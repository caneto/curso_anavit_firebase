import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/user_image_widget.dart';

class ChatCardWidget extends StatelessWidget {
  const ChatCardWidget({
    super.key,
    this.isOnline,
    required this.userImage,
    required this.userName,
    required this.content,
    required this.hour,
    required this.onTap,
    required this.notificationAmount,
  });

  final bool? isOnline;
  final String userImage;
  final String userName;
  final String content;
  final String hour;
  final int notificationAmount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          UserImageWidget(
            radius: size.width * 0.1,
            imageUrl: userImage,
            isOnline: isOnline!,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(hour),
              const SizedBox(height: 8),
              if (notificationAmount > 0) ...{
                CircleAvatar(
                  radius: 10,
                  backgroundColor: theme.badgeTheme.backgroundColor,
                  child: FittedBox(
                    child: Text(
                      notificationAmount.toString(),
                      style: theme.primaryTextTheme.labelSmall,
                    ),
                  ),
                ),
              } else
                Icon(
                  Icons.check,
                  color: theme.primaryColor,
                ),
            ],
          )
        ],
      ),
    );
  }
}
