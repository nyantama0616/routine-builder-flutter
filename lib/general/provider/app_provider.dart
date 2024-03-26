import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:routine_builder/general/enum/scenes.dart";

final appProvider = StateNotifierProvider<AppNotifier, AppState>((ref) {
  return AppNotifier(AppState(scene: Scenes.water));
});

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier(super.state);

  void setScene(Scenes newScene) {
    state = state.copyWith(scene: newScene);
  }
}

class AppState {
  final Scenes scene;

  AppState({
    required this.scene,
  });

  AppState copyWith({
    Scenes? scene,
  }) {
    return AppState(
      scene: scene ?? this.scene,
    );
  }
}
