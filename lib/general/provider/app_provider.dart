import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:routine_builder/general/model/life.dart';
import "package:routine_builder/general/enum/scenes.dart";
import 'package:routine_builder/general/query/client/home_query_client.dart';

final appProvider = StateNotifierProvider<AppNotifier, AppState>((ref) {
  return AppNotifier.init();
});

class AppNotifier extends StateNotifier<AppState> {
  
  AppNotifier.init() : super(AppState(scene: Scenes.home, status: Statuses.none)) {
    final client = HomeQueryClient(); //TODO: ここでhomeQueryClient使うのはおかしいけどね。
    client.init().then((res) {
      setStatus(res.status);
    }).catchError((e) {
      print("$e from AppNotifier.init");
    });
  }

  void setScene(Scenes newScene) {
    state = state.copyWith(scene: newScene);
  }

  void setStatus(Statuses status) {
    state = state.copyWith(status: status);
  }
}

class AppState {
  final Scenes scene;
  final Statuses status;

  AppState({
    required this.scene,
    this.status = Statuses.none,
  });

  AppState copyWith({
    Scenes? scene,
    Statuses? status,
  }) {
    return AppState(
      scene: scene ?? this.scene,
      status: status ?? this.status,
    );
  }
}
