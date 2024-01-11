import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
    required this.userName,
    required this.unreadChatCount,
    required this.onLogoutTap,
  });

  final String userName;
  final int unreadChatCount;
  final VoidCallback onLogoutTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, $userName',
                style: theme.primaryTextTheme.bodyMedium,
              ),
              Text(
                'You received',
                style: theme.primaryTextTheme.titleLarge,
              ),
              Text(
                '$unreadChatCount messages',
                style: theme.primaryTextTheme.headlineSmall,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onLogoutTap,
          icon: Icon(
            Icons.logout,
            color: theme.primaryIconTheme.color,
          ),
        )
      ],
    );
  }
}
