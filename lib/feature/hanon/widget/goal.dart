import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  Goal({super.key});

  final goals = [
    "ピアノの苦手意識をなくす",
    "すべての調に慣れる",
    "「引き出し」を増やす",
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
