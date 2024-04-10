import 'package:routine_builder/feature/walk/controller/work_controller.dart';
import 'package:routine_builder/feature/walk/enum/scenes.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';

class WalkController {
  final BasicStatuses status;
  final Scenes scene;

  final Function() goToSchool;
  final Function() goHome;
  final Function() finish;
  
  final WorkController workController;

  WalkController({
    required this.status,
    required this.scene,
    required this.goToSchool,
    required this.goHome,
    required this.finish,
    required this.workController,
  });
}
