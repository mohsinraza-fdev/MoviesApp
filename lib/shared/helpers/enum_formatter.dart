class EnumFormatter {
  static String format<T extends Enum>(T value) {
    String? result = _registry[value];
    return result ?? '<invalid-enum>';
  }

  static Map<Enum, String> get _registry => {};
}
