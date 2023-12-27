import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';
import 'core/user/user_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_module.dart';
import 'pages/chat/chat_page.dart';
import 'pages/home/home_page.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [CoreModule(), UserModule()];

  @override
  void routes(RouteManager r) {
    r.module('/', module: SplashModule());
    r.module('/login', module: LoginModule());
    r.child('/home', child: (_) => HomePage(userBloc: Modular.get()));
    r.child('/chat', child: (_) => const ChatPage());
    
    super.routes(r);
  }
}