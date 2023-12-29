
import '../../models/contact_model.dart';

sealed class ContactsState {
  const ContactsState();

  factory ContactsState.initState() {
    return const DataContactsState([]);
  }
}

class LoadingContactsState extends ContactsState {
  const LoadingContactsState();
}

class DataContactsState extends ContactsState {
  const DataContactsState(this.contacts);

  final List<ContactModel> contacts;
}

