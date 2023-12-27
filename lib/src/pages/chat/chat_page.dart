import 'package:flutter/material.dart';

import 'widgets/chat_app_bar_widget.dart';
import 'widgets/chat_text_field_widget.dart';
import 'widgets/message_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const ChatAppBarWidget(),
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
}
