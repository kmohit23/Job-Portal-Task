extension NullCheckExtension on dynamic {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}