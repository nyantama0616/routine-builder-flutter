enum Statuses {
  none("none"),
  sleep("sleep"),
  nap("nap"),
  caterpillar("caterpillar"),
  hanon("hanon"),
  tooth("tooth"),
  hiit("hiit")
  ;

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
    case "hanon":
      return Statuses.hanon;
    case "tooth":
      return Statuses.tooth;
    case "hiit":
      return Statuses.hiit;
    default:
      throw Exception("Unknown raw value: $rawValue");
  }
}
