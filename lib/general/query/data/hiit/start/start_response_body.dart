import 'package:routine_builder/general/model/hiit_train_data.dart';

class StartResponseBody {
  final HiitTrainData hiit;

  StartResponseBody({required this.hiit});

  factory StartResponseBody.fromJson(Map<String, dynamic> json) {
    return StartResponseBody(
      hiit: HiitTrainData.fromJson(json['hiit']),
    );
  }
}
