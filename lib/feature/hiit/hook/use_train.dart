import 'dart:async';
import 'dart:math';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hiit/class/train_controller.dart';
import 'package:routine_builder/feature/hiit/enum/train_statuses.dart';
import 'package:routine_builder/general/class/hiit_setting.dart';
import 'package:routine_builder/general/sound/sound_player.dart';
import 'package:routine_builder/general/sound/sounds.dart' as sounds;

const FRAME_DURATION_Millis = 40;

TrainController useTrain(
    {required HiitSetting setting, Function(int)? onFinished}) {
  final _state = useState<_State>(_State(
    status: TrainStatuses.notStarted,
    currentRound: 0,
  ));

  final currentWorkTimeMillis = useState<int>(0);
  final currentBreakTimeMillis = useState<int>(0);

  Timer? _timer;

  final _soundPlayer = SoundPlayer();

  void start() {
    _soundPlayer.playOneShot(sounds.hiitCountDown); //スタートを音声で教える
    _timer = Timer(Duration(seconds: 3), () {
      _state.value = _state.value.copyWith(
        status: TrainStatuses.workTime,
        currentRound: 0,
      );
      _soundPlayer.playOneShot(_pick(sounds.hiitStartVoices),
          delay: 500); //スタートを音声で教える
    });
  }

  void _startWorkTime() {
    currentWorkTimeMillis.value = 0;
    _state.value = _state.value.copyWith(status: TrainStatuses.workTime);

    _timer =
        Timer.periodic(Duration(milliseconds: FRAME_DURATION_Millis), (timer) {
      currentWorkTimeMillis.value += FRAME_DURATION_Millis;
      if (currentWorkTimeMillis.value >= setting.workTime * 1000) {
        _state.value = _state.value.copyWith(
          currentRound: _state.value.currentRound + 1,
          status: TrainStatuses.breakTime,
        );
        _soundPlayer.playOneShot(
            sounds.hiitNumberVoices[_state.value.currentRound]); //何回目かを音声で教える
      }
    });
  }

  void _startBreakTime() {
    currentBreakTimeMillis.value = 0;
    _state.value = _state.value.copyWith(
      status: TrainStatuses.breakTime,
    );

    _timer =
        Timer.periodic(Duration(milliseconds: FRAME_DURATION_Millis), (timer) {
      currentBreakTimeMillis.value += FRAME_DURATION_Millis;
      if (currentBreakTimeMillis.value >= setting.breakTime * 1000) {
        _state.value = _state.value.copyWith(
          status: TrainStatuses.workTime,
        );
      }
    });
  }

  useEffect(() {
    switch (_state.value.status) {
      case TrainStatuses.workTime:
        _startWorkTime();
        break;
      case TrainStatuses.breakTime:
        _startBreakTime();
        break;
      case TrainStatuses.finished:
        onFinished?.call(_state.value.currentRound);
        _soundPlayer.playOneShot(_pick(sounds.hiitFinisheVoices),
            delay: 1000); //終了を音声で教える
        break;
      default:
        break;
    }

    return () {
      _timer?.cancel(); //めっちゃ大事！
    };
  }, [_state.value.status]);

  useEffect(() {
    if (_state.value.currentRound >= setting.roundCount) {
      _state.value = _state.value.copyWith(status: TrainStatuses.finished);
    }
    return null;
  }, [_state.value.currentRound]);

  return useMemoized(
      () => TrainController(
            status: _state.value.status,
            currentWorkTimeMillis: currentWorkTimeMillis.value,
            currentBreakTimeMillis: currentBreakTimeMillis.value,
            currentRound: _state.value.currentRound,
            start: start,
          ),
      [
        _state.value,
        currentWorkTimeMillis.value,
        currentBreakTimeMillis.value
      ]);
}

class _State {
  final TrainStatuses status;
  final int currentRound;

  _State({
    required this.status,
    required this.currentRound,
  });

  _State copyWith({
    TrainStatuses? status,
    int? currentWorkTimeMillis,
    int? currentBreakTimeMillis,
    int? currentRound,
  }) {
    return _State(
      status: status ?? this.status,
      currentRound: currentRound ?? this.currentRound,
    );
  }
}

String _pick(List<String> list) {
  Random random = Random();

  return list[random.nextInt(list.length)];
}
