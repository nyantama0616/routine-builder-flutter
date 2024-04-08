import 'package:flutter/material.dart';
import 'package:routine_builder/feature/walk/widget/buttons.dart';
import 'package:routine_builder/general/widget/gage.dart';

class Work extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("目的地: 学校", style: TextStyle(fontSize: 20)),
          SizedBox(height: 30),
          Gage(0.5, color: Colors.green),
          SizedBox(height: 30),
          ArrivalButton(() {}),
          SizedBox(height: 10),
          StopButton(() {}),
        ],
      )
    );
  }
}
