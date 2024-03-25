import "package:flutter/material.dart";
import "package:routine_builder/feature/caterpillar/class/counter_controller.dart";
import "package:routine_builder/general/enum/basic_statuses.dart";
import 'package:routine_builder/general/class/caterpillar.dart';

class CaterpillarController {
  final ValueNotifier<Caterpillar?> _currentMode;
  final ValueNotifier<BasicStatuses> _status;
  final CounterController _counter;
  final ValueNotifier<Map<String, int>> _patterns;

  Function(Caterpillar mode) selectMode;
  Function() start;
  Function() stop;
  Function() toModeSelector;

  CaterpillarController(
    this._currentMode,
    this._status,
    this._counter,
    this._patterns,
    {
    required this.selectMode,
    required this.start,
    required this.stop,
    required this.toModeSelector,
  });

  Caterpillar? get currentMode => _currentMode.value;
  BasicStatuses get status => _status.value;
  int get passedSeconds => _counter.passedSeconds;
  Map<String, int> get patterns => _patterns.value;
}
