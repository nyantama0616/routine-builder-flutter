import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/walk/enum/scenes.dart';
import 'package:routine_builder/feature/walk/home/widget/home.dart';
import 'package:routine_builder/feature/walk/hook/use_walk.dart';
import 'package:routine_builder/feature/walk/work/widget/work.dart';

class Walk extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useWalk();
    final Widget mainScreen;
    switch (controller.scene) {
      case Scenes.home:
        mainScreen = Home(walkController: controller,);
        break;
      case Scenes.work:
        mainScreen = Work(walkController: controller,);
        break;
      default:
        mainScreen = Home(walkController: controller,);
    }
    return Center(
      child: mainScreen,
    );
  }
}
