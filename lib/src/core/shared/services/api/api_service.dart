
import 'i_api_service.dart';

class ApiService implements IApiService {
  
  @override
  Future<Map<String, dynamic>> getByID(String key, String id) async {
    if(key == 'users') {
      return {
        'id': id,
        'email': 'carlos@gmail.com',
        'first_name': 'Carlos',
        'last_name': 'Neto',
        'image_url': '',
        'status': 1,
        'contacts': [],
        'groups_pinned': [],
        'privates_pinned': [],
      };
    }

    return {};
  }
  
}