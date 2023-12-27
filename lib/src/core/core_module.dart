
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/services/auth/auth_service.dart';
import 'shared/services/auth/i_auth_service.dart';

class CoreModule extends Module{
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IAuthService>(AuthService.new);    
  }
}