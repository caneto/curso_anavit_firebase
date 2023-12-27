
import 'package:flutter_modular/flutter_modular.dart';

import '../core_module.dart';
import 'blocs/user_bloc.dart';
import 'repository/implementations/user_repository.dart';
import 'repository/interfaces/i_user_repository.dart';


class UserModule extends Module{

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IUserRepository>(UserRepository.new);
    i.addLazySingleton(UserBloc.new);
  }
}