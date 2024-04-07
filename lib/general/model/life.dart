import 'package:routine_builder/general/util/time.dart';
import 'package:timezone/timezone.dart' as tz;

class Life {
  final DateTime wakedUpAt;
  final DateTime? wentToBedAt;
  final int sleepSeconds;
  final int water;
  final _TrainSeconds trainSeconds;

  Life({
    required this.wakedUpAt,
    required this.wentToBedAt,
    required this.sleepSeconds,
    required this.water,
    required this.trainSeconds,
  });

  Life.init() : 
    wakedUpAt = DateTime.now(),
    wentToBedAt = null,
    sleepSeconds = 0,
    water = 0,
    trainSeconds = _TrainSeconds(hiit: 0, hanon: 0, caterpillar: 0);

  Life.initDev() : 
    wakedUpAt = DateTime.now(),
    wentToBedAt = DateTime.now().add(Duration(hours: 8)),
    sleepSeconds = 8 * 60 * 60,
    water = 0,
    trainSeconds = _TrainSeconds(hiit: 0, hanon: 0, caterpillar: 0);

  factory Life.fromJson(Map<String, dynamic> json) {
    final wakedUpAt = convertFromUTCToJST(DateTime.parse(json["wakedUpAt"]));
    final wentToBedAt = json["wentToBedAt"] == null ? null : convertFromUTCToJST(DateTime.parse(json["wentToBedAt"]));
    return Life(
      wakedUpAt: wakedUpAt,
      wentToBedAt: wentToBedAt,
      sleepSeconds: json["sleepSeconds"],
      water: json["water"],
      trainSeconds: _TrainSeconds.fromJson(json["trainSeconds"]),
    );
  }
}

class _TrainSeconds {
  final int hiit;
  final int hanon;
  final int caterpillar;

  _TrainSeconds({
    required this.hiit,
    required this.hanon,
    required this.caterpillar,
  });

  factory _TrainSeconds.fromJson(Map<String, dynamic> json) {
    return _TrainSeconds(
      hiit: json["hiit"],
      hanon: json["hanon"],
      caterpillar: json["caterpillar"],
    );
  }
}
