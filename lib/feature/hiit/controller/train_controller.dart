import "package:routine_builder/feature/hiit/enum/train_statuses.dart";

class TrainController {
  final TrainStatuses status;
  final int currentWorkTimeMillis;
  final int currentBreakTimeMillis;
  final int currentRound;
  Function() start;

  TrainController({
    required this.status,
    required this.currentWorkTimeMillis,
    required this.currentBreakTimeMillis,
    required this.currentRound,
    required this.start,
  });
}
