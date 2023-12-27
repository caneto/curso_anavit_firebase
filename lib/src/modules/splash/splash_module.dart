
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import '../../core/user/user_module.dart';
import 'pages/splash_page.dart';

class SplashModule extends Module {

  @override
  List<Module> get imports => [CoreModule(), UserModule()];
  
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => SplashPage(userBloc: Modular.get()));
  }
}