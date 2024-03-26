import 'package:flutter/material.dart';
import "package:flutter_hooks/flutter_hooks.dart";
import "package:routine_builder/feature/hiit/hook/use_hiit.dart";
import "package:routine_builder/feature/hiit/widget/goal.dart";
import "package:routine_builder/feature/hiit/widget/train.dart";
import "package:routine_builder/feature/hiit/widget/buttons.dart";
import "package:routine_builder/feature/hiit/widget/setting.dart";

//TODO: Settingをモーダルにする
class Hiit extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useHiit();
    final mainScreen = controller.showSetting ? Setting(hiitController: controller) : Train(hiitController: controller);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SettingButton(controller.toggleShowSetting),
          ),
          Goal(),
          SizedBox(width: 20, height: 20,),
          mainScreen,
        ],
      ),
    );
  }
}
