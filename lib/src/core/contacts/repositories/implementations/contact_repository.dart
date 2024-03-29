import '../../../shared/services/api/i_api_service.dart';
import '../../../shared/services/api/params/filter_param.dart';
import '../../models/contact_model.dart';
import '../interfaces/i_contact_repository.dart';

class ContactRepository implements IContactRepository {
  ContactRepository(this._apiService);

  final IApiService _apiService;
  @override
  Future<List<ContactModel>> getContactsByIDs(Set<String> ids) async {
    final filterByID = FilterParam.byID('id', ids.toList());
    final response = await _apiService.get(
      'contacts',
      filters: [filterByID],
    );

    return response.map(ContactModel.fromMap).toList();
  }
}
