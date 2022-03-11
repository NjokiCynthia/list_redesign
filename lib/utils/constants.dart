part of list_redesign_utils;

class ListValues {
  ListValues({
    required this.baseDomain,
  });

  final String baseDomain;
}

class ListConfig {
  factory ListConfig({required ListValues values}) {
    return _instance ??= ListConfig._internal(values);
  }

  ListConfig._internal(this.values);

  final ListValues values;
  static ListConfig? _instance;

  static ListConfig? get instance => _instance;
}