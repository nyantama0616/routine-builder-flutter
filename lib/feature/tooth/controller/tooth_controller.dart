import 'package:routine_builder/general/controller/counter_controller.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';

class ToothController {
  final BasicStatuses status;
  final int passedSeconds;
  Function() start;
  Function() stop;
  Function() finish;

  ToothController({
    required this.status,
    required this.start,
    required this.stop,
    required this.finish,
    required this.passedSeconds,
  });
}
