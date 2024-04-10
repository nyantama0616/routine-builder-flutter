import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/walk/controller/work_controller.dart';
import 'package:routine_builder/feature/walk/enum/work_statuses.dart';
import 'package:routine_builder/feature/walk/settings.dart' as settings;

const FRAME_DURATION_Millis = 40;

WorkController useWork() {
  final _status = useState<WorkStatuses>(WorkStatuses.notStarted);
  final _walkMilliSec = useState(0);
  final _runMilliSec = useState(0);
  Timer? _timer;

  void _startWalk() {
    _walkMilliSec.value = 0;
    _timer =
        Timer.periodic(Duration(milliseconds: FRAME_DURATION_Millis), (timer) {
      _walkMilliSec.value += FRAME_DURATION_Millis;
      if (_walkMilliSec.value >= settings.walk_seconds * 1000) {
        _status.value = WorkStatuses.running;
        return;
      }
    });
  }

  void _startRun() {
    _runMilliSec.value = 0;
    _timer =
        Timer.periodic(Duration(milliseconds: FRAME_DURATION_Millis), (timer) {
      _runMilliSec.value += FRAME_DURATION_Millis;
      if (_runMilliSec.value >= settings.run_seconds * 1000) {
        _status.value = WorkStatuses.walking;
        return;
      }
    });
  }

  void start() {
    _status.value = WorkStatuses.running;
  }

  void finish() {
    _status.value = WorkStatuses.finished;
  }

  useEffect(() {
    switch (_status.value) {
      case WorkStatuses.walking:
        _startWalk();
        break;
      case WorkStatuses.running:
        _startRun();
        break;
      default:
        break;
    }

    return () {
      _timer?.cancel();
    };
  }, [_status.value]);

  return useMemoized(() {
    return WorkController(
      status: _status.value,
      walkMilliSec: _walkMilliSec.value,
      runMilliSec: _runMilliSec.value,
      start: start,
      finish: finish,
    );
  }, [_status.value, _walkMilliSec.value, _runMilliSec.value]);
}
