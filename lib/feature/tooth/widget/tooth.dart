import 'package:flutter/widgets.dart';
import "package:flutter_hooks/flutter_hooks.dart";
import "package:routine_builder/feature/tooth/hook/use_tooth.dart";
import "package:routine_builder/feature/tooth/widget/goal.dart";
import "package:routine_builder/feature/tooth/widget/player.dart";

class Tooth extends HookWidget {
  Tooth({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTooth();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Goal(),
          SizedBox(height: 20),
          Player(toothController: controller,),
        ],
      ),
    );
  }
}
