import 'package:flutter/widgets.dart';
import "package:routine_builder/feature/tooth/widget/goal.dart";
import "package:routine_builder/feature/tooth/widget/player.dart";

class Tooth extends StatelessWidget {
  Tooth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Goal(),
          SizedBox(height: 20),
          Player(),
        ],
      ),
    );
  }
}
