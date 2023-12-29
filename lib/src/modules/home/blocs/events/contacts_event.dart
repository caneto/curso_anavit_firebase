
class ContactsEvent {
  const ContactsEvent();
}

class LoadContactsEvent extends ContactsEvent {
  const LoadContactsEvent(this.contactsIDs);
  final Set<String> contactsIDs;
}