import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hanon/class/hanon_controller.dart';
import 'package:routine_builder/feature/hanon/settings.dart';
import 'package:routine_builder/general/class/hanon.dart';
import 'package:routine_builder/general/class/hanon_patterns.dart';
import 'package:routine_builder/general/enum/basic_statuses.dart';
import 'package:routine_builder/general/hook/use_counter.dart';

HanonController useHanon() {
  final _hanonNum = useState<int?>(null);
  final _hanon = useState<Hanon?>(null);
  final _status = useState<BasicStatuses>(BasicStatuses.none);
  final _patterns = useState<HanonPatterns>(initPatterns());
  final counter = useCounter();

  void start() {
    _status.value = BasicStatuses.doing;
  }

  void stop() {
    _status.value = BasicStatuses.paused;
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

  void selectHanonNum(int hanonNum) {
    _hanonNum.value = hanonNum;
  }

  void selectHanon(Hanon hanon) {
    _hanon.value = hanon;
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
