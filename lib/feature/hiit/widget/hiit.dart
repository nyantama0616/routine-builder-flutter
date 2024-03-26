import 'package:flutter/material.dart';
import "package:routine_builder/feature/hiit/widget/goal.dart";
import "package:routine_builder/feature/hiit/widget/train.dart";
import "package:routine_builder/feature/hiit/widget/buttons.dart";

class Hiit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SettingButton(() => print("setting")),
          ),
          Goal(),
          SizedBox(width: 20, height: 20,),
          Train(),
        ],
      ),
    );
  }
}
