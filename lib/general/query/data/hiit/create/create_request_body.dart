import 'package:routine_builder/general/class/hiit_train_data.dart';

class CreateRequestBody {
  final HiitTrainData hiit;

  CreateRequestBody({required this.hiit});

  Map<String, dynamic> toJson() {
    return {
      "hiit": hiit.toJson(),
    };
  }

  factory CreateRequestBody.fromJson(Map<String, dynamic> json) {
    return CreateRequestBody(
      hiit: HiitTrainData.fromJson(json['hiit']),
    );
  }
}
