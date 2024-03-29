enum Statuses {
  none("none"),
  sleep("sleep"),
  nap("nap"),
  caterpillar("caterpillar");

  final String rawValue;
  const Statuses(this.rawValue);
}

// enumはコンストラクタを持てないらしいから、非常手段。
Statuses statusFromRawValue(String rawValue) {
  switch (rawValue) {
    case "none":
      return Statuses.none;
    case "sleep":
      return Statuses.sleep;
    case "nap":
      return Statuses.nap;
    case "caterpillar":
      return Statuses.caterpillar;
    default:
      throw Exception("Unknown raw value: $rawValue");
  }
}
