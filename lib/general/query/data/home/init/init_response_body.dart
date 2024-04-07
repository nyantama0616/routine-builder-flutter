import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/model/life.dart';

class InitResponseBody {
  final Statuses status;

  InitResponseBody({required this.status});

  factory InitResponseBody.fromJson(Map<String, dynamic> json) {
    return InitResponseBody(
      status: statusFromRawValue(json['status']),
    );
  }
}
