import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  Goal({super.key});

  final goals = [
    "歯みがき時間を短縮する",
    "健康な歯茎を",
    "無駄な時間を減らす",
  ]
      .map((goal) => ListTile(
            title: Text(goal),
            leading: Icon(Icons.label),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 280,
          child: ListView(
            shrinkWrap: true,
            children: goals,
          ),
        ),
      ],
    );
  }
}
