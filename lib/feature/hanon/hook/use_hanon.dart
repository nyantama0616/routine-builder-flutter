import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hanon/class/hanon_controller.dart';
import 'package:routine_builder/feature/hanon/settings.dart';
import 'package:routine_builder/general/class/hanon.dart';
import 'package:routine_builder/general/class/hanon_patterns.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/hook/use_counter.dart';
import 'package:routine_builder/general/query/client/hanon_query_client.dart';
import 'package:routine_builder/feature/hanon/settings.dart';

HanonController useHanon() {
  final _hanonNum = useState<int?>(3);
  // final _hanon = useState<Hanon?>(null);
  final _hanon = useState<Hanon?>(Hanon(num: 3, pattern: "1:CM", passedSeconds: 0));
  final _status = useState<BasicStatuses>(BasicStatuses.none);
  final _patterns = useState<HanonPatterns>(initPatterns());
  final client = HanonQueryClient();

  void selectHanonNum(int hanonNum) {
    _hanonNum.value = hanonNum;
  }

  void selectHanon(Hanon hanon) {
    _hanon.value = hanon;
  }

  void _finish() {
    client.finish().then((res) {
      _status.value = BasicStatuses.success;
      selectHanonNum(res.hanon.num);
      selectHanon(res.hanon);
    }).catchError((e) {
      _status.value = BasicStatuses.failed;
      print("$e from finish");
      return;
    });
  }

  final counter = useCounter(onFinished: _finish, goalSeconds: TRAIN_SECONDS);

  void start() {
    if (_hanonNum.value == null || _hanon.value == null) {
      return;
    }

    print("start");
    client.start(num: _hanonNum.value!, pattern: _hanon.value!.pattern)
      .then((res) {
      _status.value = BasicStatuses.doing;
      selectHanonNum(res.hanon.num);
      selectHanon(res.hanon);
      counter.reset();
      counter.start(res.timer.startedAt, res.timer.passedSecondsWhenStopped);
    }).catchError((e) {
      print("$e from start");
      return;
    });
  }

  void stop() {
    client.stop().then((res) {
      _status.value = BasicStatuses.none;
      selectHanonNum(res.hanon.num);
      selectHanon(res.hanon);
      counter.stop(res.timer.passedSecondsWhenStopped);
    }).catchError((e) {
      print("$e from stop");
      return;
    });
  }

  void handleBack() {
    if (_status.value == BasicStatuses.doing) {
      return;
    }

    if (_hanon.value != null) {
      _hanon.value = null;
      return;
    }

    if (_hanonNum.value != null) {
      _hanonNum.value = null;
      return;
    }
  }

  return useMemoized(() {
    return HanonController(
      hanonNum: _hanonNum.value,
      hanon: _hanon.value,
      status: _status.value,
      counter: counter,
      patterns: _patterns.value,
      passedSeconds: counter.passedSeconds,
      start: start,
      stop: stop,
      handleBack: handleBack,
      selectHanonNum: selectHanonNum,
      selectHanon: selectHanon,
    );
  }, [_hanonNum.value, _hanon.value, _status.value, counter, _patterns.value]);
}

HanonPatterns initPatterns() {
  HanonPatterns patterns = HanonPatterns();
  for (int i = 1; i <= HANON_NUM; i++) {
    Map<String, int> x = {};
    for (int j = 1; j <= HANON_PATTERN_NUM; j++) {
      SCALES.forEach((scale) {
        final pattern = "$j:$scale";
        x[pattern] = 0;
      });
    }
    patterns[i] = x;
  }

  patterns[3]!["1:CM"] = 30 * 60;
  return patterns;
}