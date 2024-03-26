import "package:flutter_hooks/flutter_hooks.dart";
import "package:routine_builder/feature/hiit/class/setting_form_controller.dart";

SettingFormController useSettingForm(
    {required workTime, required breakTime, required setCount}) {
  final _state = useState<_SettingFormState>(_SettingFormState(
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

class _SettingFormState {
  final int workTime;
  final int breakTime;
  final int setCount;

  _SettingFormState(
      {required this.workTime,
      required this.breakTime,
      required this.setCount});

  _SettingFormState copyWith({int? workTime, int? breakTime, int? setCount}) {
    return _SettingFormState(
      workTime: workTime ?? this.workTime,
      breakTime: breakTime ?? this.breakTime,
      setCount: setCount ?? this.setCount,
    );
  }
}
