import "package:flutter_hooks/flutter_hooks.dart";
import "package:routine_builder/feature/hiit/controller/setting_form_controller.dart";
import "package:routine_builder/general/model/hiit_setting.dart";

SettingFormController useSettingForm(HiitSetting setting) {
  final _state = useState<HiitSetting>(HiitSetting(
      workTime: setting.workTime,
      breakTime: setting.breakTime,
      roundCount: setting.roundCount
  ));

  void setWorkTime(int workTime) {
    _state.value = _state.value.copyWith(workTime: workTime);
  }

  void setBreakTime(int breakTime) {
    _state.value = _state.value.copyWith(breakTime: breakTime);
  }

  void setSetCount(int roundCount) {
    _state.value = _state.value.copyWith(roundCount: roundCount);
  }

  final workTimeOptions =
      List<int>.generate((90 - 5) ~/ 5 + 1, (i) => 5 * (i + 1));
  final breakTimeOptions = workTimeOptions;
  final setCountOptions = List<int>.generate(30, (i) => i + 1);

  return useMemoized(
      () => SettingFormController(
            workTime: _state.value.workTime,
            breakTime: _state.value.breakTime,
            roundCount: _state.value.roundCount,
            setWorkTime: setWorkTime,
            setBreakTime: setBreakTime,
            setRoundCount: setSetCount,
            workTimeOptions: workTimeOptions,
            breakTimeOptions: breakTimeOptions,
            roundCountOptions: setCountOptions,
          ),
      [_state.value]);
}
