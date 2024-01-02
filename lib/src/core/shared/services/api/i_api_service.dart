import 'params/filter_param.dart';

abstract class IApiService {
  Future<Map<String, dynamic>> getByID(String key, String id);
  Future<List<Map<String, dynamic>>> filter(
    String key, {
    required List<FilterParam> filters,
  });
}
