

class UiErrors<T extends Enum> {
  late Map<T, String?> _errors;

  String? getError(T field) {
    return _errors.containsKey(field) ? _errors[field] : null;
  }

  UiErrors({
      Map<T, String?> Function(Map<T, dynamic>)? validator,
      Map<T, dynamic> values = const {},
  }) {

    _errors = validator == null ? {} : validator(values);
  }

  bool get ok => _errors.values.every((e) => e == null);

}

String getStringField<T extends Enum>(Map<T, dynamic> values, T key) {
  return values.containsKey(key) ? values[key] as String : "";
}
