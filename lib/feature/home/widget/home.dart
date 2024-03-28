import 'package:flutter/material.dart';
import "package:flutter_hooks/flutter_hooks.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:routine_builder/feature/dev/ping/use_ping.dart";
import "package:routine_builder/feature/home/widget/buttons.dart";
import "package:routine_builder/general/enum/scenes.dart";
import "package:routine_builder/general/provider/app_provider.dart";
import "package:routine_builder/general/query/query_statuses.dart";

class Home extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pingController = usePing(); //TODO: homeQueryClientあるからいらん。消す。

    final message = pingController.status == QueryStatuses.doing
        ? Text("Loading...")
        : pingController.status == QueryStatuses.failure || !pingController.authorized
        ? Text(
            "ネットワークエラー！！",
            style: TextStyle(color: Colors.red),
          )
        : pingController.status == QueryStatuses.success && pingController.authorized
            ? Text("ようこそ！")
        : Text("nothing");

    useEffect(() {
      pingController.submit();
      return null;
    }, []);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, children: [
          message,
          SizedBox(
            width: 20,
            height: 20,
          ),
          _Buttons(),
        ]
      )
    );
  }
}

class _Buttons extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appController = ref.watch(appProvider.notifier);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SleepButton(() {
        appController.setScene(Scenes.sleep);
      }),
      SizedBox(
        width: 20,
        height: 20,
      ),
      CaterpillarButton(() {
        appController.setScene(Scenes.caterpillar);
      }),
      SizedBox(
        width: 20,
        height: 20,
      ),
      WaterButton(() {
        appController.setScene(Scenes.water);
      }),
      SizedBox(
        width: 20,
        height: 20,
      ),
      HiitButton(() {
        appController.setScene(Scenes.hiit);
      }),
      SizedBox(
        width: 20,
        height: 20,
      ),
      PingButton(() {
        appController.setScene(Scenes.ping);
      }),
    ]);
  }
}
