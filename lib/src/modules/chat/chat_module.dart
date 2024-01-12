import 'package:flutter_modular/flutter_modular.dart';

import 'pages/chat_page.dart';

class ChatModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/:id',
      child: (_) => ChatPage(
        chatID: r.args.params['id'],
      ),
    );
  }
}
