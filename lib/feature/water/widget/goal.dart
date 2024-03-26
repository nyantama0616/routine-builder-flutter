import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  Goal({super.key});

  final problems = [
    "集中力の低下",
    "認知機能の低下",
    "疲労感の増加",
  ]
      .map((goal) => ListTile(
            title: Text(goal),
            leading: Icon(Icons.label),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("水分が不足すると...", style: TextStyle(fontSize: 20)),
      Container(
        width: 220,
        child: ListView(
          shrinkWrap: true,
          children: problems,
        ),
      ),
    ]);
  }
}
