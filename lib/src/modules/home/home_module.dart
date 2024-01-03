import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import '../../core/user/user_module.dart';
import 'blocs/contacts_bloc.dart';
import 'blocs/filter_chat_bloc.dart';
import 'pages/home_page.dart';
import 'repositories/implementations/contact_repository.dart';
import 'repositories/interfaces/i_contact_repository.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), UserModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<IContactRepository>(ContactRepository.new);
    i.addLazySingleton(ContactsBloc.new);
    i.addLazySingleton(FilterChatBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => HomePage(
        userBloc: Modular.get(),
        contactsBloc: Modular.get(),
        filterChatBloc: Modular.get(),
      ),
    );
  }
}
