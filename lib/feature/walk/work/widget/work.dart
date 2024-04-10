import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/walk/controller/walk_controller.dart';
import 'package:routine_builder/feature/walk/controller/work_controller.dart';
import 'package:routine_builder/feature/walk/widget/buttons.dart';
import 'package:routine_builder/feature/walk/work/widget/work_helper.dart';
import 'package:routine_builder/general/widget/gage.dart';

class Work extends HookWidget {
  final WalkController walkController;

  Work({required this.walkController});

  @override

  Widget build(BuildContext context) {
    final helper = WorkHelper(walkController: walkController);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          helper.destinationMessage,
          helper.saveResultMessage,
          SizedBox(height: 30),
          Gage(helper.gageProgress, color: helper.gageColor),
          SizedBox(height: 30),
          ArrivalButton(walkController.finish),
          SizedBox(height: 10),
          StopButton(() {}), //TODO: 実装
        ],
      )
    );
  }
}
