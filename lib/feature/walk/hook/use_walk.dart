import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/walk/controller/walk_controller.dart';
import 'package:routine_builder/feature/walk/enum/scenes.dart';
import 'package:routine_builder/feature/walk/hook/use_work.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';

WalkController useWalk() {
  final _status = useState<BasicStatuses>(BasicStatuses.none);
  final _scene = useState<Scenes>(Scenes.home);
  final workController = useWork();

  void goToSchool() {
    _scene.value = Scenes.work;
    workController.start();
  }

  void goHome() {
    _scene.value = Scenes.work;
    workController.start();
  }

  void finish() {
    workController.finish();
  }

  return useMemoized(() {
    return WalkController(
      status: _status.value,
      scene: _scene.value,
      goToSchool: goToSchool,
      goHome: goHome,
      finish: finish,
      workController: workController,
    );
  }, [_status.value, _scene.value, workController]);
}
