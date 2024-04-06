import 'package:routine_builder/general/model/hiit_train_data.dart';
import 'package:routine_builder/general/model/life.dart';

class StartResponseBody {
  final HiitTrainData hiit;
  final Life todayLife;

  StartResponseBody({required this.hiit, required this.todayLife});

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      hiit: HiitTrainData.fromJson(json['hiit']),
      todayLife: Life.fromJson(json['todayLife']),
    );
  }
}
