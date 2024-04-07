import 'package:routine_builder/general/model/life.dart';

class TodayResponseBody {
  final Life life;

  TodayResponseBody({required this.life});

  factory TodayResponseBody.fromJson(Map<String, dynamic> json) {
    return TodayResponseBody(
      life: Life.fromJson(json['life']),
    );
  }
}
