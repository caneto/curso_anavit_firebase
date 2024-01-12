import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  });

  final ChatBloc chatBloc;
  final String chatID;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();

    widget.chatBloc.add(LoadByIDChatEvent(widget.chatID));
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
                    ListView(
                      reverse: true,
                      children: const [
                        MessageWidget.myMessage(
                          sendedAt: '10:32',
                          content:
                              'Texto de Teste um ................. ............. .................',
                        ),
                        MessageWidget.otherMessage(
                          userImage:
                              'https://avatars.githubusercontent.com/u/2157300?v=4',
                          isOnline: true,
                          sendedAt: '10:35',
                          content:
                              'Texto de Teste dois......... ............. .............. .............',
                        ),
                        MessageWidget.myMessage(
                          imagesUrl: [
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                          ],
                          sendedAt: '10:32',
                          content:
                              'Texto de Teste um ................. ............. .................',
                        ),
                        MessageWidget.otherMessage(
                          imagesUrl: [
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                          ],
                          userImage:
                              'https://avatars.githubusercontent.com/u/2157300?v=4',
                          isOnline: true,
                          sendedAt: '10:35',
                          content:
                              'Texto de Teste dois......... ............. .............. .............',
                        ),
                        MessageWidget.myMessage(
                          imagesUrl: [
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                          ],
                          sendedAt: '10:32',
                          content:
                              'Texto de Teste um ................. ............. .................',
                        ),
                        MessageWidget.otherMessage(
                          imagesUrl: [
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                            'https://avatars.githubusercontent.com/u/2157300?v=4',
                          ],
                          userImage:
                              'https://avatars.githubusercontent.com/u/2157300?v=4',
                          isOnline: true,
                          sendedAt: '10:35',
                          content:
                              'Texto de Teste dois......... ............. .............. .............',
                        ),
                      ],
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
