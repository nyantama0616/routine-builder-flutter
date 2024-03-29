import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routine_builder/feature/hanon/hook/use_hanon.dart';
import 'package:routine_builder/feature/hanon/widget/goal.dart';
import 'package:routine_builder/feature/hanon/widget/mode_selector.dart';
import 'package:routine_builder/feature/hanon/widget/player.dart';
import 'package:routine_builder/general/provider/app_provider.dart';
import 'package:routine_builder/general/widget/back_button.dart' as back;

class Hanon extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNotifier = ref.watch(appProvider.notifier);
    final controller = useHanon(appNotifier: appNotifier);
    final mainScreen = controller.hanon == null ? ModeSelector(hanonController: controller,) : Player(hanonController: controller);
    
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Goal(),
        //TODO: ちゃんと位置調整する
        Row(
          children: [
            SizedBox(width: 56),
            back.BackButton(onPressed: controller.handleBack)
          ],
        ),
        mainScreen,
      ],
    ));
  }
}
