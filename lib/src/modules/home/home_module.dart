import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import '../../core/user/user_module.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  
  @override
  List<Module> get imports => [CoreModule(), UserModule()];

  @override
  void binds(Injector i) {
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => HomePage(userBloc: Modular.get()));
  }
}