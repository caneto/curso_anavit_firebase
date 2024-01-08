import 'params/filter_param.dart';

abstract class IApiService {
  Future<Map<String, dynamic>> getByID(String key, String id);
  Future<List<Map<String, dynamic>>> get(
    String key, {
    List<FilterParam> filters,
    OrderByParam orderBy,
    int? limit,
  });
  Future<int> count(
    String key, {
    List<FilterParam> filters,
  });
}

class OrderByParam {
  const OrderByParam({
    required this.key,
    this.descending = true,
  });

  final String key;
  final bool descending;
}
