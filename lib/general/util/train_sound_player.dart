import 'dart:async';
import 'package:routine_builder/general/sound/sound_player.dart';
import 'package:routine_builder/general/sound/sounds.dart' as sounds;

class TrainSoundPlayer {
  final _soundPlayer = SoundPlayer();
  Timer? _timer;

  void playCountDownToStart(Function() callback) {
    _soundPlayer.playOneShot(sounds.caterpillarCountDownToStart);
    
    _timer?.cancel();
    _timer = Timer(Duration(seconds: 3), callback);
  }

  void playSaveSuccess() {
    _soundPlayer.playOneShot(sounds.caterpillarSaveSuccess);
  }

  void playSaveFailed() {
    _soundPlayer.playOneShot(sounds.caterpillarSaveFailed);
  }

  // TODO: いる？
  void dispose() {
    _timer?.cancel();
  }
}
