import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/model/life.dart';

class StartResponseBody {
  final Statuses status;

  StartResponseBody({
    required this.status,
  });

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      status: statusFromRawValue(json['status']),
    );
  }
}
