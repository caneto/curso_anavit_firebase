import 'package:flutter/material.dart';

import '../../../widgets/user_image_widget.dart';

class StatusCardWidgets extends StatelessWidget {
  const StatusCardWidgets({
    super.key,
    required this.isOnline,
    required this.userImage,
    required this.userName,
  });

  final bool isOnline;
  final String userImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        UserImageWidget(
          radius: size.width * .0885,
          imageUrl: userImage,
          isOnline: isOnline,
        ),
        const SizedBox(height: 12),
        Text(
          userName,
          style: theme.primaryTextTheme.bodyMedium,
        )
      ],
    );
  }
}
