import 'package:routine_builder/general/model/hanon.dart';
import 'package:routine_builder/general/model/hanon_patterns.dart';
import 'package:routine_builder/general/controller/counter_controller.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';

class HanonController {
  final int? hanonNum;
  final Hanon? hanon;
  final BasicStatuses status;
  final CounterController counter;
  final HanonPatterns patterns;
  final int passedSeconds;
  Function() start;
  Function() stop;
  Function() handleBack;
  Function(int) selectHanonNum;
  Function(Hanon hanon) selectHanon;

  HanonController({
    required this.hanonNum,
    required this.hanon,
    required this.status,
    required this.counter,
    required this.patterns,
    required this.passedSeconds,
    required this.start,
    required this.stop,
    required this.handleBack,
    required this.selectHanonNum,
    required this.selectHanon,
  });
}
