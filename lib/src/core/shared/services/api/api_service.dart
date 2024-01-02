import 'i_api_service.dart';
import 'params/filter_param.dart';

class ApiService implements IApiService {
  @override
  Future<Map<String, dynamic>> getByID(String key, String id) async {
    if (key == 'users') {
      return {
        'id': id,
        'email': 'carlos@gmail.com',
        'first_name': 'Carlos',
        'last_name': 'Neto',
        'image_url': 'https://avatars.githubusercontent.com/u/2157300?v=4',
        'status': 1,
        'contacts': [],
        'groups_pinned': [],
        'privates_pinned': [],
      };
    }

    return {};
  }

  @override
  Future<List<Map<String, dynamic>>> filter(
    String key, {
    required List<FilterParam> filters,
  }) async {
    if (key == 'contacts') {
      return [
        {
          'id': 'ID',
          'first_name': 'Contato1',
          'last_name': '1',
          'image_url': 'https://avatars.githubusercontent.com/u/2157300?v=4',
          'status': 1,
        },
        {
          'id': 'ID',
          'first_name': 'Contato2',
          'last_name': '2',
          'image_url': 'https://avatars.githubusercontent.com/u/2157300?v=4',
          'status': 2,
        }
      ];
    }
    return [];
  }
}
