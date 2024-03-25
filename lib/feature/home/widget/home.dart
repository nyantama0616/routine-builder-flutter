import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:routine_builder/feature/home/widget/buttons.dart";
import "package:routine_builder/general/enum/scenes.dart";
import "package:routine_builder/general/provider/app_provider.dart";

class Home extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appController = ref.watch(appProvider.notifier);
    
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SleepButton(() {
            appController.setScene(Scenes.sleep);
          }),
          SizedBox(width: 20, height: 20,),
          Caterpillar(() {
            appController.setScene(Scenes.caterpillar);
          }),
        ]
      )
    );
  }
}
