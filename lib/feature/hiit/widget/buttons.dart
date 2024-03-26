import 'package:flutter/material.dart';
import 'package:routine_builder/feature/sleep/widget/button_base.dart';

final StartButton = (Function()? onPressed) => ButtonBase(text: "スタート", onPressed: onPressed, icon: Icon(Icons.play_circle_outline), color: Colors.green);
final SettingButton = (Function()? onPressed) => IconButton(icon: Icon(Icons.settings), onPressed: onPressed);
