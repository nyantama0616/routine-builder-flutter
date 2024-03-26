import 'package:flutter/material.dart';

class Today extends StatelessWidget {
  Today({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("今日の水分摂取量", style: TextStyle(fontSize: 20)),
        Text("2000ml", style: TextStyle(fontSize: 20)),
      ],
    );
  } 
}
