import 'package:flutter/material.dart';
import 'package:routine_builder/feature/walk/widget/buttons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SchoolButton(() {}),
          SizedBox(height: 20),
          HomeButton(() {}),
        ],
      )
    );
  }
}
