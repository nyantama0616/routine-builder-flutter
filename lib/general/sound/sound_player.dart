import "dart:async";

import "package:audioplayers/audioplayers.dart";

class SoundPlayer {
  final player = AudioPlayer();
  
  Timer? _timer;

  void playOneShot(String path, {int delay = 0}) {
    if (delay > 0) {
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: delay), () {
        player.play(AssetSource(path));
      });
    } else {
      player.play(AssetSource(path));
    }
  }
}
