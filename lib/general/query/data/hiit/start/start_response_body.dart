import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/model/hiit_train_data.dart';
import 'package:routine_builder/general/model/life.dart';

class StartResponseBody {
  final HiitTrainData hiit;
  final Statuses status;

  StartResponseBody({required this.hiit, required this.status});

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      hiit: HiitTrainData.fromJson(json['hiit']),
      status: statusFromRawValue(json['status']),
    );
  }
}
