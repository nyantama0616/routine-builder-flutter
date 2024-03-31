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
        : pingController.status == QueryStatuses.failure ||
                !pingController.authorized
            ? Text(
                "ネットワークエラー！！",
                style: TextStyle(color: Colors.red),
              )
            : pingController.status == QueryStatuses.success &&
                    pingController.authorized
                ? Text("ようこそ！")
                : Text("nothing");

    useEffect(() {
      pingController.submit();
      return null;
    }, []);

    final appController = ref.watch(appProvider.notifier);

    final sleepButton = SleepButton(() {
      appController.setScene(Scenes.sleep);
    });

    final caterpillarButton = CaterpillarButton(() {
      appController.setScene(Scenes.caterpillar);
    });

    final waterButton = WaterButton(() {
      appController.setScene(Scenes.water);
    });

    final hiitButton = HiitButton(() {
      appController.setScene(Scenes.hiit);
    });

    final pingButton = PingButton(() {
      appController.setScene(Scenes.ping);
    });

    final hanonButton = HanonButton(() {
      appController.setScene(Scenes.hanon);
    });

    final toothButton = ToothButton(() {
      appController.setScene(Scenes.tooth);
    });

    final foodCostButton = FoodCostButton(() {
      appController.setScene(Scenes.foodCost);
    });

    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: pingButton,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            message,
            SizedBox(
              width: 20,
              height: 20,
            ),
            _ButtonsRow([sleepButton, waterButton, toothButton]),
            SizedBox(
              height: 20,
            ),
            _ButtonsRow([hiitButton, caterpillarButton, hanonButton]),
            SizedBox(
              height: 20,
            ),
            _ButtonsRow([foodCostButton]),
          ])
        )
      ],
    );
  }
}

class _ButtonsRow extends HookConsumerWidget {
  final List<HomeButtonBase> buttons;
  _ButtonsRow(this.buttons);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var children = <Widget>[];
    buttons.forEach((button) {
      children.add(button);
      children.add(SizedBox(
        width: 20,
      ));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
