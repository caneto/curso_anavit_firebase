import 'package:flutter_modular/flutter_modular.dart';

import '../../core/contacts/contacts_module.dart';
import '../../core/core_module.dart';
import '../../core/user/user_module.dart';
import 'blocs/chat_bloc.dart';
import 'pages/chat_page.dart';
import 'repository/implementations/chat_repository.dart';
import 'repository/implementations/message_repository.dart';
import 'repository/interfaces/i_chat_repository.dart';
import 'repository/interfaces/i_message_repository.dart';

class ChatModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), UserModule(), ContactsModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton<IMessageRepository>(MessageRepository.new);
    i.addLazySingleton<IChatRepository>(ChatRepository.new);
    i.addLazySingleton(ChatBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/:id',
      child: (_) => ChatPage(
        chatID: r.args.params['id'],
        chatBloc: Modular.get(),
        contactsBloc: Modular.get(),
        userBloc: Modular.get(),
      ),
    );
  }
}
