import "package:audioplayers/audioplayers.dart";

class SoundPlayer {
  final player = AudioPlayer();

  void playOneShot(String path) {
    player.play(AssetSource(path));
  }
}
