import 'package:chat_firebase/src/core/shared/themes/app_colors_extension.dart';
import 'package:flutter/material.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    super.key,
    required this.radius,
    required this.imageUrl,
    required this.isOnline,
  });

  final double radius;
  final String imageUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsExtension>();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          foregroundImage: NetworkImage(
            imageUrl,
          ),
        ),
        Positioned(
          bottom: -2,
          right: -2,
          child: Container(
            decoration: BoxDecoration(
              color: isOnline ? colors?.onLine : colors?.offLine,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isOnline ? Icons.check : Icons.add,
              color: theme.iconTheme.color,
            ),
          ),
        )
      ],
    );
  }
}
