
enum FilterType { id }

class FilterParam {
  const FilterParam._(this.key,this.type,this.value);

  factory FilterParam.byID(String key, List<String> value) {
    return FilterParam._(key, FilterType.id, value);
  }

  final String key;
  final FilterType type;
  final dynamic value;
}