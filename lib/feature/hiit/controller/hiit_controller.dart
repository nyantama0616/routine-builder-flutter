import 'package:routine_builder/feature/hiit/controller/train_controller.dart';
import 'package:routine_builder/general/model/hiit_setting.dart';
import 'package:routine_builder/general/model/hiit_train_data.dart';

class HiitController {
  final bool showSetting;
  final bool saveTrainSuccess;
  final HiitSetting setting;
  final TrainController trainController;

  final Function() toggleShowSetting;
  final Function() startTrain;
  final Function(HiitSetting) saveSetting;
  // Function(HiitTrainData) saveTrainData;

  HiitController({
    required this.showSetting,
    required this.saveTrainSuccess,
    required this.setting,
    required this.trainController,
    required this.toggleShowSetting,
    required this.saveSetting,
    required this.startTrain,
  });
}
