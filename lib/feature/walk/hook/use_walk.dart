import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/walk/controller/walk_controller.dart';
import 'package:routine_builder/feature/walk/enum/scenes.dart';
import 'package:routine_builder/feature/walk/hook/use_work.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/enum/places.dart';
import 'package:routine_builder/general/query/client/walk_query_client.dart';
import 'package:routine_builder/general/util/train_sound_player.dart';

WalkController useWalk() {
  final _status = useState<BasicStatuses>(BasicStatuses.none);
  final _scene = useState<Scenes>(Scenes.home);
  final _to = useState<Places>(Places.home);
  final workController = useWork();
  final _tsPlayer = TrainSoundPlayer();
  final _client = WalkQueryClient();

  void _goTo(Places to) {
    Places from = to == Places.fun ? Places.home : Places.fun;
    _tsPlayer.playCountDownToStart(() {
      _client.start(from: from, to: to).then((res) {
        _scene.value = Scenes.work;
        _status.value = BasicStatuses.doing;
        _to.value = to;
        workController.start();
      }).catchError((e) {
        print("$e from _goTo");
      });
    });
  }

  void goToSchool() {
    _goTo(Places.fun);
  }

  void goHome() {
    _goTo(Places.home);
  }

  void stop() {
    workController.stop();
    _client.stop().then((res) {
      _status.value = BasicStatuses.paused;
    }).catchError((e) {
      print("$e from stop");
    });
  }

  void restart() {
    _client.restart().then((res) {
      workController.start();
      _status.value = BasicStatuses.doing;
    }).catchError((e) {
      print("$e from restart");
    });
  }

  void finish() {
    workController.finish();
    _client.finish().then((res) {
      _status.value = BasicStatuses.success;
      _tsPlayer.playSaveSuccess();
    }).catchError((e) {
      _status.value = BasicStatuses.failed;
      _tsPlayer.playSaveFailed();
      print("$e from finish");
    });
  }

  return useMemoized(() {
    return WalkController(
      status: _status.value,
      scene: _scene.value,
      to: _to.value,
      goToSchool: goToSchool,
      goHome: goHome,
      stop: stop,
      restart: restart,
      finish: finish,
      workController: workController,
    );
  }, [_status.value, _scene.value, workController]);
}
