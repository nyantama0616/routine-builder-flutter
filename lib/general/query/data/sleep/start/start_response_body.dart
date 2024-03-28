import 'package:routine_builder/general/class/life.dart';

class StartResponseBody {
  final Life todayLife;

  StartResponseBody({
    required this.todayLife,
  });

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      todayLife: Life.fromJson(json["todayLife"]),
    );
  }
}
