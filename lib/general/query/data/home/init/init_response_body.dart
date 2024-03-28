import 'package:routine_builder/general/class/life.dart';

class InitResponseBody {
  final Life todayLife;

  InitResponseBody({required this.todayLife});

  factory InitResponseBody.fromJson(Map<String, dynamic> json) {
    return InitResponseBody(
      todayLife: Life.fromJson(json['todayLife']),
    );
  }
}
