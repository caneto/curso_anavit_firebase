import 'package:flutter_bloc/flutter_bloc.dart';

import '../contacts_module.dart';
import '../models/contact_model.dart';
import '../repositories/interfaces/i_contact_repository.dart';
import 'events/contacts_event.dart';
import 'state/contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(
    this._repository,
  ) : super(ContactsState.initState()) {
    on<LoadContactsEvent>(_load);
  }

  final IContactRepository _repository;

  List<ContactModel> get contacts => state.contacts;

  Future<void> _load(
    LoadContactsEvent event,
    Emitter<ContactsState> emit,
  ) async {
    emit(const LoadingContactsState());

    final contacts = await _repository.getContactsByIDs(event.contactsIDs);

    emit(DataContactsState(contacts));
  }
}
