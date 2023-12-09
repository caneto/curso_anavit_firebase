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
                color: isOnline ? Colors.green : Colors.amber,
                shape: BoxShape.circle,
              ),
              child: isOnline ? const Icon(Icons.check) : const Icon(Icons.add)),
        )
      ],
    );
  }
}
