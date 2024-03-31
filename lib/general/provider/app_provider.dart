import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_builder/general/class/life.dart';
import "package:routine_builder/general/enum/scenes.dart";
import 'package:routine_builder/general/query/client/home_query_client.dart';

final appProvider = StateNotifierProvider<AppNotifier, AppState>((ref) {
  return AppNotifier.init();
});

class AppNotifier extends StateNotifier<AppState> {
  
  AppNotifier.init() : super(AppState(scene: Scenes.foodCost, todayLife: Life.init())) {
    final client = HomeQueryClient(); //TODO: ここでhomeQueryClient使うのはおかしいけどね。
    client.init().then((res) {
      setTodayLife(res.todayLife);
    }).catchError((e) {
      print(e);
    });
  }

  void setScene(Scenes newScene) {
    state = state.copyWith(scene: newScene);
  }

  void setTodayLife(Life todayLife) {
    state = state.copyWith(todayLife: todayLife);
  }
}

class AppState {
  final Scenes scene;
  final Life todayLife;

  AppState({
    required this.scene,
    required this.todayLife,
  });

  AppState copyWith({
    Scenes? scene,
    Life? todayLife,
  }) {
    return AppState(
      scene: scene ?? this.scene,
      todayLife: todayLife ?? this.todayLife,
    );
  }
}
