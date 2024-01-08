
enum FilterType { id, contains, equal }

class FilterParam {
  const FilterParam._(this.key,this.type,this.value);

  factory FilterParam.byID(String key, List<String> value) {
    return FilterParam._(key, FilterType.id, value);
  }

  factory FilterParam.contains(String key, String value) {
    return FilterParam._(key, FilterType.contains, value);
  }

  factory FilterParam.equal(String key, Object value) {
    return FilterParam._(key, FilterType.equal, value);
  }

  final String key;
  final FilterType type;
  final dynamic value;
}