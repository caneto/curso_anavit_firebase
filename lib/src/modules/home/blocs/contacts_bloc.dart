import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/interfaces/i_contact_repository.dart';
import 'events/contacts_event.dart';
import 'states/contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(
    this._repository,
  ) : super(ContactsState.initState()) {
    on<LoadContactsEvent>(_load);
  }

  final IContactRepository _repository;

  Future<void> _load(
    LoadContactsEvent event,
    Emitter<ContactsState> emit,
  ) async {
    emit(const LoadingContactsState());

    final contacts = await _repository.getContactsByIDs(event.contactsIDs);

    emit(DataContactsState(contacts));
  }
}
