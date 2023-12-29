import 'package:flutter/material.dart';

import '../../../core/shared/themes/app_colors_extension.dart';

class ChatAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsExtension>();

    return AppBar(
      backgroundColor: Colors.blue,
      title: Column(
        children: [
          Text(
            'Carlos Alberto',
            style: theme.primaryTextTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: colors?.onLine,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'OnLine',
                style: theme.primaryTextTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
