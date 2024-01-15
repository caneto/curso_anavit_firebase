import 'package:flutter_modular/flutter_modular.dart';

import '../../core/contacts/contacts_module.dart';
import '../../core/core_module.dart';
import '../../core/user/user_module.dart';
import 'blocs/chats_bloc.dart';
import 'blocs/filter_chat_bloc.dart';
import 'pages/home_page.dart';
import 'repositories/implementations/chat_repository.dart';
import 'repositories/interfaces/i_chat_repository.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), UserModule(), ContactsModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<IChatRepository>(ChatRepository.new);
    i.addLazySingleton(ChatsBloc.new);
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
        chatsBloc: Modular.get(),
      ),
    );
  }
}
