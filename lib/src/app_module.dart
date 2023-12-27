import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';
import 'pages/chat/chat_page.dart';
import 'pages/home/home_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/login', module: LoginModule());
    r.child('/', child: (_) => const HomePage());
    r.child('/chat', child: (_) => const ChatPage());
    
    super.routes(r);
  }
}