
import '../../models/contact_model.dart';

sealed class ContactsState {
  const ContactsState(this.contacts);

  factory ContactsState.initState() {
    return const DataContactsState([]);
  }

  final List<ContactModel> contacts;
}

class LoadingContactsState extends ContactsState {
  const LoadingContactsState(): super(const []);
}

class DataContactsState extends ContactsState {
  const DataContactsState(super.contacts);

  
}

