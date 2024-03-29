import 'package:flutter/material.dart';
import 'package:routine_builder/feature/hanon/class/hanon_controller.dart';
import 'package:routine_builder/general/class/hanon.dart';
import 'package:routine_builder/general/widget/counter.dart';
import 'package:routine_builder/general/widget/counter_submit_button.dart';

class Player extends StatelessWidget {
  final HanonController hanonController;

  Player({super.key, required this.hanonController});

  @override
  Widget build(BuildContext context) {
    final hanon = hanonController.hanon;

    return Center(
      child: Container(
          height: 400,
          width: 250,
          color: Color.fromARGB(255, 193, 212, 247),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("第${hanon!.num}番", style: TextStyle(fontSize: 36)),
              Text(hanon.pattern, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Counter(30 * 60),
              SizedBox(height: 10),
              StartButton(() {}),
            ],
          )),
    );
  }
}
