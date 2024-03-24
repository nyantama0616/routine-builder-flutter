enum BasicStatuses {
  none("none"),
  doing("doing"),
  paused("paused"),
  success("success"),
  failed("failed");

  final String rawValue;
  const BasicStatuses(this.rawValue);
}
