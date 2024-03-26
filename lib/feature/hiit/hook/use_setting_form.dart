import "package:flutter_hooks/flutter_hooks.dart";
import "package:routine_builder/feature/hiit/class/setting_form_controller.dart";
import "package:routine_builder/general/class/hiit_setting.dart";

SettingFormController useSettingForm(
    {required workTime, required breakTime, required setCount}) {
  final _state = useState<HiitSetting>(HiitSetting(
      workTime: workTime, breakTime: breakTime, setCount: setCount));

  void setWorkTime(int workTime) {
    _state.value = _state.value.copyWith(workTime: workTime);
  }

  void setBreakTime(int breakTime) {
    _state.value = _state.value.copyWith(breakTime: breakTime);
  }

  void setSetCount(int setCount) {
    _state.value = _state.value.copyWith(setCount: setCount);
  }

  final workTimeOptions =
      List<int>.generate((90 - 5) ~/ 5 + 1, (i) => 5 * (i + 1));
  final breakTimeOptions = workTimeOptions;
  final setCountOptions = List<int>.generate(30, (i) => i + 1);

  return useMemoized(
      () => SettingFormController(
            workTime: _state.value.workTime,
            breakTime: _state.value.breakTime,
            roundCount: _state.value.setCount,
            setWorkTime: setWorkTime,
            setBreakTime: setBreakTime,
            setRoundCount: setSetCount,
            workTimeOptions: workTimeOptions,
            breakTimeOptions: breakTimeOptions,
            roundCountOptions: setCountOptions,
          ),
      [_state.value]);
}
