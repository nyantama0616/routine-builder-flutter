import 'package:routine_builder/feature/walk/enum/work_statuses.dart';

class WorkController {
  final WorkStatuses status;
  final int walkMilliSec;
  final int runMilliSec;
  final Function() start;
  final Function() finish;

  WorkController({
    required this.status,
    required this.walkMilliSec,
    required this.runMilliSec,
    required this.start,
    required this.finish,
  });
}
