import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget.myMessage({super.key})
      : _isMyMessage = true,
        userImage = null,
        isOnline = null;

  const MessageWidget.otherMessage({
    required String this.userImage,
    required bool this.isOnline,
    super.key,
  }) : _isMyMessage = false;

  final bool _isMyMessage;
  final bool? isOnline;
  final String? userImage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(builder: (_, constraints) {
      return Container(
        padding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxWidth: constraints.maxWidth * 0.7,
        ),
        decoration: BoxDecoration(
          color: _isMyMessage ? Colors.white : theme.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Text('Teste ....111 222.222.33..33.1441.3kioipoipoi232'),
      );
    });
  }
}
