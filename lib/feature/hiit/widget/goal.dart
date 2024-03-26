import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  Goal({super.key});

  final goals = [
    "筋力UPによる自信を",
    "疲れにくい体を",
    "意志力も向上するかも",
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
          width: 250,
          child: ListView(
            shrinkWrap: true,
            children: goals,
          ),
        ),
      ],
    );
  }
}
