import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/chat_bloc.dart';
import 'pages/chat_page.dart';
import 'repository/implementations/chat_repository.dart';
import 'repository/interfaces/i_chat_repository.dart';

class ChatModule extends Module {

  @override
  void binds(Injector i) {
    i.addLazySingleton<IChatRepository>(ChatRepository.new);
    i.addLazySingleton(ChatBloc.new);
    
  }
  @override
  void routes(RouteManager r) {
    r.child(
      '/:id',
      child: (_) => ChatPage(
        chatID: r.args.params['id'], chatBloc: Modular.get(),
      ),
    );
  }
}
