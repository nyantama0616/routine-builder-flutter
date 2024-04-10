import 'package:flutter/material.dart';
import 'package:routine_builder/feature/walk/controller/work_controller.dart';
import 'package:routine_builder/feature/walk/enum/work_statuses.dart';
import 'package:routine_builder/feature/walk/settings.dart' as settings;

class WorkHelper {
  final WorkController workController;

  WorkHelper({required this.workController});

  double get gageProgress {
    if (workController.status == WorkStatuses.running) {
      return workController.runMilliSec / (settings.run_seconds * 1000);
    } else if (workController.status == WorkStatuses.walking) {
      return 1 - workController.walkMilliSec / (settings.walk_seconds * 1000);
    } else {
      return 0.0;
    }
  }

  Color get gageColor {
    if (workController.status == WorkStatuses.running) {
      return Colors.green;
    } else if (workController.status == WorkStatuses.walking) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }
}
