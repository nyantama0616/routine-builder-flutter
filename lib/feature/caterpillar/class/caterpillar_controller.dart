import "package:flutter/material.dart";
import "package:routine_builder/feature/caterpillar/class/counter_controller.dart";
import "package:routine_builder/general/enum/basic_statuses.dart";
import 'package:routine_builder/general/class/caterpillar.dart';

class CaterpillarController {
  final ValueNotifier<Caterpillar?> _currentMode;
  final ValueNotifier<BasicStatuses> _status;
  final CounterController _counter;

  Function(Caterpillar mode) selectMode;
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

  Caterpillar? get currentMode => _currentMode.value;
  BasicStatuses get status => _status.value;
  int get passedSeconds => _counter.passedSeconds;
}
