import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/tooth/controller/tooth_controller.dart';
import 'package:routine_builder/feature/tooth/settings.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/hook/use_counter.dart';
import 'package:routine_builder/general/query/client/tooth_query_client.dart';
import 'package:routine_builder/general/util/train_sound_player.dart';

ToothController useTooth() {
  final _status = useState<BasicStatuses>(BasicStatuses.none);
  final _counter = useCounter();
  final client = ToothQueryClient();
  final tsPlayer = TrainSoundPlayer();

  void _init() {
    client.init().then((res) {
      if (res.inProgress != null) {
        _counter.reset();
        _counter.start(res.inProgress!.timer.startedAt,
            res.inProgress!.timer.passedSecondsWhenStopped);
        _status.value = BasicStatuses.doing;
      }
    }).catchError((e) {
      print("$e from init");
      return;
    });
  }

  void start() {
    tsPlayer.playCountDownToStart(() {
      client.start().then((res) {
        _counter.reset();
        _counter.start(res.timer.startedAt, res.timer.passedSecondsWhenStopped);
        _status.value = BasicStatuses.doing;
      }).catchError((e) {
        print("$e from start");
        return;
      });
    });
  }

  void stop() {
    client.stop().then((res) {
      _counter.stop(res.timer.passedSecondsWhenStopped);
      _status.value = BasicStatuses.none;
    }).catchError((e) {
      print("$e from stop");
      return;
    });
  }

  void finish() {
    client.finish().then((res) {
      _counter.stop(res.timer.passedSecondsWhenStopped);
      _status.value = BasicStatuses.success;
      tsPlayer.playSaveSuccess();
    }).catchError((e) {
      tsPlayer.playSaveFailed();
      print("$e from finish");
      return;
    });
  }

  useEffect(() {
    _init();
    return () {
      tsPlayer.dispose();
    };
  }, []);

  return useMemoized(() {
    return ToothController(
      status: _status.value,
      passedSeconds: _counter.passedSeconds,
      start: start,
      stop: stop,
      finish: finish,
    );
  }, [_status.value, _counter.passedSeconds]);
}
