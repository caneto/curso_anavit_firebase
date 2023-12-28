
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/services/api/api_service.dart';
import 'shared/services/api/i_api_service.dart';
import 'shared/services/auth/auth_service.dart';
import 'shared/services/auth/i_auth_service.dart';

class CoreModule extends Module{
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IAuthService>(AuthService.new);    
    i.addLazySingleton<IApiService>(ApiService.new);    
  }
}