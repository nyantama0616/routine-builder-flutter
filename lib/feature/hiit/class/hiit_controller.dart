import 'package:routine_builder/general/class/hiit_setting.dart';
import 'package:routine_builder/general/class/hiit_train_data.dart';

class HiitController {
  final bool showSetting;
  final HiitSetting setting;

  Function() toggleShowSetting;
  Function(HiitSetting) saveSetting;
  Function(HiitTrainData) saveTrainData;

  HiitController({
    required this.showSetting,
    required this.setting,
    required this.toggleShowSetting,
    required this.saveSetting,
    required this.saveTrainData,
  });
}
