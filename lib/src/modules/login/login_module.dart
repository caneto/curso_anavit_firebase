
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import 'blocs/login_bloc.dart';
import 'pages/login_page.dart';
import 'repository/implementations/login_repository.dart';
import 'repository/interfaces/i_login_repository.dart';

class LoginModule extends Module {
  
  @override
  List<Module> get imports => [CoreModule()];

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