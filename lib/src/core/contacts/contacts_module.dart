import 'package:flutter_modular/flutter_modular.dart';

import '../core_module.dart';
import 'blocs/contacts_bloc.dart';
import 'repositories/implementations/contact_repository.dart';
import 'repositories/interfaces/i_contact_repository.dart';

class ContactsModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IContactRepository>(ContactRepository.new);
    i.addLazySingleton(ContactsBloc.new);
  }
}
