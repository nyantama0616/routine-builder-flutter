import 'package:routine_builder/general/model/hiit_setting.dart';
import 'package:routine_builder/general/model/hiit_train_data.dart';

class StartRequestBody {
  final int workTime;
  final int breakTime;

  StartRequestBody({
    required this.workTime,
    required this.breakTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'workTime': workTime,
      'breakTime': breakTime,
    };
  }
}
