import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  Goal({super.key});

  final goals = [
    "「適当」に弾けるようになる",
    "ギターで作曲できるようになる",
    "RAD弾けるようになる",
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
        Text(
          "目標",
          style: TextStyle(fontSize: 20),
        ),
        Container(
          // color: Colors.blue, // ここで背景色を設定します
          width: 320,
          child: ListView(
            shrinkWrap: true,
            children: goals,
          ),
        ),
      ],
    );
  }
}
