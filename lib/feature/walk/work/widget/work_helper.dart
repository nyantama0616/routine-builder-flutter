import 'package:flutter/material.dart';
import 'package:routine_builder/feature/walk/controller/walk_controller.dart';
import 'package:routine_builder/feature/walk/controller/work_controller.dart';
import 'package:routine_builder/feature/walk/enum/work_statuses.dart';
import 'package:routine_builder/feature/walk/settings.dart' as settings;
import 'package:routine_builder/feature/walk/widget/buttons.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/enum/places.dart';

class WorkHelper {
  final WalkController walkController;
  final WorkController workController;

  WorkHelper({required this.walkController})
      : workController = walkController.workController;

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

  Widget get destinationMessage {
    final to = walkController.to == Places.fun ? "未来大" : "自宅";
    return Text("目的地: $to", style: TextStyle(fontSize: 20));
  }

  Widget get saveResultMessage {
    Color color;
    String text;
    switch (walkController.status) {
      case (BasicStatuses.success):
        color = Colors.green;
        text = "正常終了";
        break;
      case (BasicStatuses.failed):
        color = Colors.red;
        text = "異常終了";
        break;
      default:
        return Container();
    }
    return Text(text, style: TextStyle(color: color, fontSize: 20));
  }

  Widget get buttons {
    if (walkController.status == BasicStatuses.paused) {
      return RestartButton(walkController.restart);
    }

    return Column(
      children: [
        ArrivalButton(walkController.finish),
        SizedBox(height: 10),
        StopButton(walkController.stop),
      ],
    );
  }
}
