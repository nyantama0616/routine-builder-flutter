import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/hiit/class/hiit_controller.dart';
import 'package:routine_builder/general/class/hiit_setting.dart';
import 'package:routine_builder/general/class/hiit_train_data.dart';
import 'package:routine_builder/general/query/client/hiit_query_client.dart';
import 'package:routine_builder/general/util/train_sound_player.dart';

HiitController useHiit() {
  final _state = useState<_State>(_State(
    showSetting: false,
    saveTrainSuccess: false,
    isTraining: false,
    setting: HiitSetting.init(),
  ));

  final _client = HiitQueryClient();
  final _tsPlayer = TrainSoundPlayer();

  void toggleShowSetting() {
    if (_state.value.isTraining) return; //TODO: UI側で非表示にするべき
    _state.value =
        _state.value.copyWith(showSetting: !_state.value.showSetting);
  }

  void start() {
    _state.value =
        _state.value.copyWith(isTraining: true, saveTrainSuccess: false);
  }

  void saveSetting(HiitSetting setting) {
    _client.updateSetting(setting).then((res) {
      _state.value = _state.value.copyWith(setting: res.hiitSetting);
    }).catchError((e) {
      print(e);
    });
  }

  void saveTrainData(HiitTrainData setting) {
    _client.create(setting).then((res) {
      _state.value = _state.value.copyWith(saveTrainSuccess: true);
      _tsPlayer.playSaveSuccess();
    }).catchError((e) {
      print(e);
      _state.value = _state.value.copyWith(saveTrainSuccess: false);
      _tsPlayer.playSaveFailed();
    });
  }

  void init() {
    _client.init().then((res) {
      _state.value = _state.value.copyWith(setting: res.hiitSetting);
    }).catchError((e) {
      print(e);
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
            toggleShowSetting: toggleShowSetting,
            saveSetting: saveSetting,
            saveTrainData: saveTrainData,
          ),
      [_state.value]);
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
