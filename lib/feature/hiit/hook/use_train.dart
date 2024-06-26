import 'dart:async';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hiit/controller/train_controller.dart';
import 'package:routine_builder/feature/hiit/enum/train_statuses.dart';
import 'package:routine_builder/general/model/hiit_setting.dart';
import 'package:routine_builder/general/sound/sound_player.dart';
import 'package:routine_builder/general/sound/sounds.dart' as sounds;
import "package:routine_builder/general/extention/list.dart";
import 'package:routine_builder/general/util/train_sound_player.dart';

const FRAME_DURATION_Millis = 40;

TrainController useTrain(
    {required HiitSetting setting, Function(int)? onFinished}) {
  final _state = useState<_State>(_State());

  final currentWorkTimeMillis = useState<int>(0);
  final currentBreakTimeMillis = useState<int>(0);

  Timer? _timer;

  final _soundPlayer = SoundPlayer();
  final _tsPlayer = TrainSoundPlayer();

  void start() {
    _tsPlayer.playCountDownToStart(() {
      _state.value = _state.value.copyWith(
        status: TrainStatuses.workTime,
        currentRound: 0,
      );
      _soundPlayer.playOneShot(sounds.hiitStartVoices.pick(), delay: 1000); //スタートを音声で教える
    });
  }

  void _startWorkTime() {
    currentWorkTimeMillis.value = 0;
    _state.value = _state.value.copyWith(
        status: TrainStatuses.workTime, playedToBreakTimeSound: false);

    _timer =
        Timer.periodic(Duration(milliseconds: FRAME_DURATION_Millis), (timer) {
      currentWorkTimeMillis.value += FRAME_DURATION_Millis;
      if (currentWorkTimeMillis.value >= setting.workTime * 1000) {
        _state.value = _state.value.copyWith(
          currentRound: _state.value.currentRound + 1,
          status: TrainStatuses.breakTime,
        );
        _soundPlayer.playOneShot(
            sounds.hiitNumberVoices[_state.value.currentRound], delay: 500); //何回目かを音声で教える
        return;
      }

      //ワークタイム終了3秒前を音声で教える
      if (currentWorkTimeMillis.value >= setting.workTime * 1000 - 3000 &&
          !_state.value.playedToBreakTimeSound) {
        _soundPlayer.playOneShot(sounds.hiitToBreakTime);
        _state.value = _state.value.copyWith(playedToBreakTimeSound: true);
      }
    });
  }

  void _startBreakTime() {
    currentBreakTimeMillis.value = 0;
    _state.value = _state.value.copyWith(
      status: TrainStatuses.breakTime,
      playedToWorkTimeSound: false,
    );

    _timer =
        Timer.periodic(Duration(milliseconds: FRAME_DURATION_Millis), (timer) {
      currentBreakTimeMillis.value += FRAME_DURATION_Millis;
      if (currentBreakTimeMillis.value >= setting.breakTime * 1000) {
        _state.value = _state.value.copyWith(
          status: TrainStatuses.workTime,
        );
        return;
      }

      //ブレークタイム終了3秒前を音声で教える
      if (currentBreakTimeMillis.value >= setting.breakTime * 1000 - 3000 &&
          !_state.value.playedToWorkTimeSound) {
        _soundPlayer.playOneShot(sounds.hiitToWorkTime);
        _state.value = _state.value.copyWith(playedToWorkTimeSound: true);
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
        _soundPlayer.playOneShot(sounds.hiitFinisheVoices.pick(), delay: 1000); //終了を音声で教える
        break;
      default:
        break;
    }

    return () {
      _timer?.cancel(); //めっちゃ大事！
      _tsPlayer.dispose();
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
  final bool playedToWorkTimeSound;
  final bool playedToBreakTimeSound;

  _State({
    this.status = TrainStatuses.notStarted,
    this.currentRound = 0,
    this.playedToWorkTimeSound = false,
    this.playedToBreakTimeSound = false,
  });

  _State copyWith({
    TrainStatuses? status,
    int? currentRound,
    bool? playedToWorkTimeSound,
    bool? playedToBreakTimeSound,
  }) {
    return _State(
      status: status ?? this.status,
      currentRound: currentRound ?? this.currentRound,
      playedToWorkTimeSound:
          playedToWorkTimeSound ?? this.playedToWorkTimeSound,
      playedToBreakTimeSound:
          playedToBreakTimeSound ?? this.playedToBreakTimeSound,
    );
  }
}
