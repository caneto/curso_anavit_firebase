
import '../../models/contact_model.dart';

abstract class IContactRepository {
  Future<List<ContactModel>> getContactsByIDs(Set<String> ids);
}