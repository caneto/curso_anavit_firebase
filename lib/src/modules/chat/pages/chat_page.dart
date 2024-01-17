import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/contacts/blocs/contacts_bloc.dart';
import '../../../core/user/blocs/user_bloc.dart';
import '../blocs/chat_bloc.dart';
import '../blocs/events/chat_event.dart';
import '../blocs/state/chat_state.dart';
import 'widgets/chat_app_bar_widget.dart';
import 'widgets/chat_text_field_widget.dart';
import 'widgets/message_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.chatID,
    required this.chatBloc,
    required this.contactsBloc,
    required this.userBloc,
  });

  final ContactsBloc contactsBloc;
  final ChatBloc chatBloc;
  final UserBloc userBloc;
  final String chatID;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();

    widget.chatBloc.add(LoadChatEvent(
      chatID: widget.chatID,
      contacts: widget.contactsBloc.contacts,
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.chatID);
    }

    return BlocBuilder(
      bloc: widget.chatBloc,
      builder: (_, ChatState state) {
        switch (state) {
          case InitialChatState():
          // TODO: Handle this case.
          case LoadingChatStatge():
            return const CircularProgressIndicator.adaptive();
          case DataChatState():
            return Scaffold(
              appBar: ChatAppBarWidget(
                name: state.chat.name,
                isOnline: state.chat.userStatus?.isOnline,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    ListView.builder(
                      reverse: true,
                      itemCount: state.messages.length,
                      itemBuilder: (_, index) {
                        final message = state.messages.elementAt(index);

                        final userID = widget.userBloc.user.id;
                        final sendedAt = message.sendedAt.toString();

                        final isMyMessage = state.isMyMessage(message, userID);

                        if (isMyMessage) {
                          MessageWidget.myMessage(
                            sendedAt: sendedAt,
                            content: message.contact,
                            imagesUrl: message.imageUrl.toList(),
                          );
                        }

                        final contact = state.getContact(message.senderID);
                        return MessageWidget.otherMessage(
                          userImage: contact.imageUrl,
                          isOnline: contact.status.isOnline,
                          sendedAt: sendedAt,
                          content: message.contact,
                        );
                      },
                    ),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: ChatTextFieldWidget(
                        onSendMessage: (String content) {},
                        onAttach: () {},
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
