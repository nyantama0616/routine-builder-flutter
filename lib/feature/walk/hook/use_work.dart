import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/walk/controller/work_controller.dart';
import 'package:routine_builder/feature/walk/enum/work_statuses.dart';
import 'package:routine_builder/feature/walk/settings.dart' as settings;
import 'package:routine_builder/general/sound/sound_player.dart';
import 'package:routine_builder/general/sound/sounds.dart' as sounds;
import "package:routine_builder/general/extention/list.dart";

const FRAME_DURATION_Millis = 40;

WorkController useWork() {
  final _status = useState<WorkStatuses>(WorkStatuses.notStarted);
  final _walkMilliSec = useState(0);
  final _runMilliSec = useState(0);
  final _playedSwitchSound = useState(false);
  Timer? _timer;
  final _soundPlayer = SoundPlayer();

  void _startWalk() {
    _walkMilliSec.value = 0;
    _timer =
        Timer.periodic(Duration(milliseconds: FRAME_DURATION_Millis), (timer) {
      _walkMilliSec.value += FRAME_DURATION_Millis;
      if (_walkMilliSec.value >= settings.walk_seconds * 1000) {
        _status.value = WorkStatuses.running;
        return;
      }
      if (_walkMilliSec.value >= settings.walk_seconds * 1000 - 3000 && !_playedSwitchSound.value) {
        _soundPlayer.playOneShot(sounds.walkToRunning);
        _playedSwitchSound.value = true;
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
      if (_runMilliSec.value >= settings.run_seconds * 1000 - 3000 && !_playedSwitchSound.value) {
        _soundPlayer.playOneShot(sounds.walkToWalking);
        _playedSwitchSound.value = true;
      }
    });
  }

  void start() {
    _status.value = WorkStatuses.running;
    _soundPlayer.playOneShot(sounds.walkStartVoices.pick(), delay: 1000);
  }

  void stop() {
    _status.value = WorkStatuses.notStarted;
    _timer?.cancel(); //多分いらない
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
      _playedSwitchSound.value = false;
    };
  }, [_status.value]);

  return useMemoized(() {
    return WorkController(
      status: _status.value,
      walkMilliSec: _walkMilliSec.value,
      runMilliSec: _runMilliSec.value,
      start: start,
      stop: stop,
      finish: finish,
    );
  }, [_status.value, _walkMilliSec.value, _runMilliSec.value]);
}
