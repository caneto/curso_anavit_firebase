import 'package:chat_firebase/src/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget.myMessage({
    required this.sendedAt,
    super.key,
  })  : _isMyMessage = true,
        userImage = null,
        isOnline = null;

  const MessageWidget.otherMessage({
    required String this.userImage,
    required bool this.isOnline,
    required this.sendedAt,
    super.key,
  }) : _isMyMessage = false;

  final bool _isMyMessage;
  final String sendedAt;
  final bool? isOnline;
  final String? userImage;

  MainAxisAlignment get rowAligment {
    if (_isMyMessage) return MainAxisAlignment.end;
    return MainAxisAlignment.start;
  }

  CrossAxisAlignment get colunmAligment {
    if (_isMyMessage) return CrossAxisAlignment.end;
    return CrossAxisAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (_, constraints) {
        return Row(
          mainAxisAlignment: rowAligment,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_isMyMessage) ...[
              UserImageWidget(
                radius: constraints.maxWidth * 0.06,
                imageUrl: userImage!,
                isOnline: isOnline!,
              ),
              const SizedBox(width: 12),
            ],
            Column(
              crossAxisAlignment: colunmAligment,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: _isMyMessage ? theme.primaryColor: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Teste ....111 222.222.33..33.1441.3kioipoipoi232',
                    style: _isMyMessage
                        ? theme.primaryTextTheme.bodyMedium
                        : theme.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  sendedAt,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
