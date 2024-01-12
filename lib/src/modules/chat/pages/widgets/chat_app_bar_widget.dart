import 'package:flutter/material.dart';

import '../../../../core/shared/themes/app_colors_extension.dart';

class ChatAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBarWidget({
    super.key,
    required this.name,
    this.isOnline,
  });

  final String name;
  final bool? isOnline;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsExtension>();

    return AppBar(
      backgroundColor: colors?.primary,
      title: Column(
        children: [
          Text(
            name,
            style: theme.primaryTextTheme.titleLarge,
          ),
          if (isOnline != null) ...{
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
          }
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
