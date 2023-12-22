
import 'package:chat_firebase/src/modules/login/repository/implementations/login_repository.dart';
import 'package:chat_firebase/src/modules/login/repository/interfaces/i_login_repository.dart';
import 'package:chat_firebase/src/modules/login/stores/login_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ILoginRepository>(LoginRepository.new);
    i.add(LoginBloc.new);
    super.binds(i);
  }
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => LoginPage(loginBloc: Modular.get()));
   
    super.routes(r);
  }
}