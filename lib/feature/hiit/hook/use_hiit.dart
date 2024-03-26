import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hiit/class/hiit_controller.dart';
import 'package:routine_builder/general/class/hiit_setting.dart';
import 'package:routine_builder/general/class/hiit_train_data.dart';

HiitController useHiit() {
  final _state = useState<_State>(_State(
    showSetting: false,
    isTraining: false,
    setting: HiitSetting(
      workTime: 5,
      breakTime: 5,
      setCount: 1,
    ),
  ));

  void toggleShowSetting() {
    _state.value =
        _state.value.copyWith(showSetting: !_state.value.showSetting);
  }

  void start() {
    _state.value = _state.value.copyWith(isTraining: true);
  }

  void saveSetting(HiitSetting setting) {
    _state.value = _state.value.copyWith(setting: setting);
  }

  void saveTrainData(HiitTrainData setting) {
    print("saveTrainData: $setting");
  }

  return useMemoized(
      () => HiitController(
            showSetting: _state.value.showSetting,
            setting: _state.value.setting,
            toggleShowSetting: toggleShowSetting,
            saveSetting: saveSetting,
            saveTrainData: saveTrainData,
          ),
      [_state.value]);
}

class _State {
  final bool showSetting;
  final bool isTraining;
  final HiitSetting setting;

  _State({
    required this.showSetting,
    required this.isTraining,
    required this.setting,
  });

  _State copyWith({bool? showSetting, bool? isTraining, HiitSetting? setting}) {
    return _State(
      showSetting: showSetting ?? this.showSetting,
      isTraining: isTraining ?? this.isTraining,
      setting: setting ?? this.setting,
    );
  }
}
