import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hiit/controller/hiit_controller.dart';
import 'package:routine_builder/feature/hiit/hook/use_train.dart';
import 'package:routine_builder/general/model/hiit_setting.dart';
import 'package:routine_builder/general/model/hiit_train_data.dart';
import 'package:routine_builder/general/provider/app_provider.dart';
import 'package:routine_builder/general/query/client/hiit_query_client.dart';
import 'package:routine_builder/general/util/train_sound_player.dart';

HiitController useHiit({required AppNotifier appNotifier}) {
  final _state = useState<_State>(_State(
    showSetting: false,
    saveTrainSuccess: false,
    isTraining: false,
    setting: HiitSetting.init(),
  ));

  final _client = HiitQueryClient();
  final _tsPlayer = TrainSoundPlayer();

  void finishTrain(int roundCount) {
    _state.value = _state.value.copyWith(isTraining: false);
    _client.finish(roundCount).then((res) {
      _state.value = _state.value.copyWith(saveTrainSuccess: true);
      appNotifier.setStatus(res.status);
      _tsPlayer.playSaveSuccess();
    }).catchError((e) {
      print("$e from finishTrain");
      _state.value = _state.value.copyWith(saveTrainSuccess: false);
      _tsPlayer.playSaveFailed();
    });
  }

  final trainController =
      useTrain(setting: _state.value.setting, onFinished: finishTrain);

  void toggleShowSetting() {
    if (_state.value.isTraining) return; //TODO: UI側で非表示にするべき
    _state.value =
        _state.value.copyWith(showSetting: !_state.value.showSetting);
  }

  void startTrain() {
    _client.start(_state.value.setting).then((res) {
      _state.value =
          _state.value.copyWith(isTraining: true, saveTrainSuccess: false);
      appNotifier.setStatus(res.status);
      trainController.start();
    }).catchError((e) {
      print("$e from startTrain");
    });
  }

  void saveSetting(HiitSetting setting) {
    _client.updateSetting(setting).then((res) {
      _state.value = _state.value.copyWith(setting: res.hiitSetting);
    }).catchError((e) {
      print("$e from saveSetting");
    });
  }

  void init() {
    _client.init().then((res) {
      _state.value = _state.value.copyWith(setting: res.hiitSetting);
    }).catchError((e) {
      print("$e from init");
    });
  }

  useEffect(() {
    init();
    return () {
      _tsPlayer.dispose();
    };
  }, []);

  return useMemoized(
      () => HiitController(
            showSetting: _state.value.showSetting,
            saveTrainSuccess: _state.value.saveTrainSuccess,
            setting: _state.value.setting,
            trainController: trainController,
            toggleShowSetting: toggleShowSetting,
            saveSetting: saveSetting,
            startTrain: startTrain,
          ),
      [_state.value, trainController]);
}

class _State {
  final bool showSetting;
  final bool saveTrainSuccess;
  final bool isTraining;
  final HiitSetting setting;

  _State({
    required this.showSetting,
    required this.saveTrainSuccess,
    required this.isTraining,
    required this.setting,
  });

  _State copyWith(
      {bool? showSetting,
      bool? saveTrainSuccess,
      bool? isTraining,
      HiitSetting? setting}) {
    return _State(
      showSetting: showSetting ?? this.showSetting,
      saveTrainSuccess: saveTrainSuccess ?? this.saveTrainSuccess,
      isTraining: isTraining ?? this.isTraining,
      setting: setting ?? this.setting,
    );
  }
}
