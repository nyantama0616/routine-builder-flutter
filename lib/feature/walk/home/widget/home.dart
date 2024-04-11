import 'package:flutter/material.dart';
import 'package:routine_builder/feature/walk/controller/walk_controller.dart';
import 'package:routine_builder/feature/walk/widget/buttons.dart';

class Home extends StatelessWidget {
  final WalkController walkController;

  Home({required this.walkController});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SchoolButton(walkController.goToSchool),
        SizedBox(height: 20),
        HomeButton(walkController.goHome),
      ],
    ));
  }
}
