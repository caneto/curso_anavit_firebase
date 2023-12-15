import 'package:flutter/material.dart';

class ChatTextFieldWidget extends StatefulWidget {
  const ChatTextFieldWidget({
    super.key,
    required this.onSendMessage,
    required this.onAttach,
  });

  final void Function(String content) onSendMessage;
  final void Function() onAttach;

  @override
  State<ChatTextFieldWidget> createState() => _ChatTextFieldWidgetState();
}

class _ChatTextFieldWidgetState extends State<ChatTextFieldWidget> {
  final textEC = TextEditingController();
  bool hasText = false;

  void sendMessage() {
    if(!hasText) return;
    widget.onSendMessage(textEC.text);
  }

  @override
  void initState() {
    super.initState();

    textEC.addListener(handleSendIcon);
  }

  void handleSendIcon() {
    late bool newValue;
    if (textEC.text.isEmpty) {
      newValue = false;
    } else {
      newValue = true;
    }

    if (hasText != newValue) {
      setState(() {
        hasText = newValue;
      });
    }
  }

  @override
  void dispose() {
    textEC.removeListener(handleSendIcon);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: widget.onAttach,
        ),
        Expanded(
          child: TextField(
            controller: textEC,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Type Message',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(
                Icons.emoji_emotions_outlined,
                color: theme.iconTheme.color,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 28,
          backgroundColor: theme.primaryColor,
          child: IconButton(
            color: theme.primaryIconTheme.color,
            onPressed: sendMessage,
            icon: hasText
                ? const Icon(Icons.send_rounded)
                : const Icon(Icons.mic_none_rounded),
          ),
        ),
      ],
    );
  }
}
