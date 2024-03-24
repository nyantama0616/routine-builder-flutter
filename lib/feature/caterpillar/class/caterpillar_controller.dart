import "package:flutter/material.dart";
import "package:routine_builder/feature/caterpillar/class/mode.dart";
import "package:routine_builder/feature/caterpillar/class/counter_controller.dart";
import "package:routine_builder/general/enum/basic_statuses.dart";

class CaterpillarController {
  final ValueNotifier<Mode?> _currentMode;
  final ValueNotifier<BasicStatuses> _status;
  final CounterController _counter;

  Function(Mode mode) selectMode;
  Function() start;
  Function() stop;

  CaterpillarController(
    this._currentMode,
    this._status,
    this._counter,
    {
      required this.selectMode,
      required this.start,
      required this.stop,
    }
  );

  Mode? get currentMode => _currentMode.value;
  BasicStatuses get status => _status.value;
  int get passedSeconds => _counter.passedSeconds;
}
