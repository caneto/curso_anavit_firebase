import 'dart:math';

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
  Future<List<Map<String, dynamic>>> get(
    String key, {
    List<FilterParam> filters = const [],
    OrderByParam? orderBy,
    int? limit,
  }) async {
    if (key == 'contacts') {
      return [
        {
          'id': 'CONTACT-1',
          'first_name': 'Contato1',
          'last_name': '1',
          'image_url': 'https://avatars.githubusercontent.com/u/2157300?v=4',
          'status': 1,
        },
        {
          'id': 'CONTACT-2',
          'first_name': 'Contato2',
          'last_name': '2',
          'image_url': 'https://avatars.githubusercontent.com/u/2157300?v=4',
          'status': 2,
        }
      ];
    }

    if (key == 'chats') {
      return [
        {
          'id': 'CHAT-ID1',
          'name': 'Group 01',
          'image_url': 'https://avatars.githubusercontent.com/u/2157300?v=4',
          'users_id': ['CONTACT-1', 'USER-ID'],
          'chat_status': 1,
        },
        {
          'id': 'CHAT-ID2',
          'name': 'Group 02',
          'image_url': 'https://avatars.githubusercontent.com/u/2157300?v=4',
          'users_id': ['CONTACT-1', 'USER-ID'],
          'chat_status': 2,
        }
      ];
    }

    if (key == 'messages') {
      return [
        {
          'id': 'CHAT-ID1',
          'content': 'Last Message',
          'sended_at': DateTime.now().millisecondsSinceEpoch,
        }
      ];
    }

    return [];
  }

  @override
  Future<int> count(String key, {List<FilterParam> filters = const []}) async {
    return Random().nextInt(5);
  }
}
