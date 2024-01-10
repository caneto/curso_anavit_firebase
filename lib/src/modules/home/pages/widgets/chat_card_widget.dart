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
  });

  final bool? isOnline;
  final VoidCallback onTap;
  final String userImage;
  final String userName;
  final String content;
  final String hour;

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
          Column(
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
          Column(
            children: [
              Text(hour),
              const SizedBox(height: 8),
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
