import "package:flutter/material.dart";
import "package:routine_builder/feature/caterpillar/class/counter_controller.dart";
import "package:routine_builder/general/enum/basic_statuses.dart";
import 'package:routine_builder/general/class/caterpillar.dart';

class CaterpillarController {
  final Caterpillar? currentMode;
  final BasicStatuses status;
  final CounterController counter;
  final Map<String, int> patterns;
  final int passedSeconds;

  Function(Caterpillar mode) selectMode;
  Function() start;
  Function() stop;
  Function() toModeSelector;

  CaterpillarController(
    {
    required this.currentMode,
    required this.status,
    required this.counter,
    required this.patterns,
    required this.selectMode,
    required this.start,
    required this.stop,
    required this.toModeSelector,
    required this.passedSeconds
  });
}
