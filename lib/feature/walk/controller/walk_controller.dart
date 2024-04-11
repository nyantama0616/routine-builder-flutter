import 'package:routine_builder/feature/walk/controller/work_controller.dart';
import 'package:routine_builder/feature/walk/enum/scenes.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/enum/places.dart';

class WalkController {
  final BasicStatuses status;
  final Scenes scene;
  final Places to;

  final Function() goToSchool;
  final Function() goHome;
  final Function() stop;
  final Function() restart;
  final Function() finish;
  
  final WorkController workController;

  WalkController({
    required this.status,
    required this.scene,
    required this.to,
    required this.goToSchool,
    required this.goHome,
    required this.stop,
    required this.restart,
    required this.finish,
    required this.workController,
  });
}
