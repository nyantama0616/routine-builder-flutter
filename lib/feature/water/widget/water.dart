import 'package:flutter/material.dart';
import 'package:routine_builder/feature/water/widget/goal.dart';
import 'package:routine_builder/feature/water/widget/today.dart';
import 'package:routine_builder/feature/water/widget/buttons.dart';

class Water extends StatelessWidget {
  Water({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Goal(),
          SizedBox(height: 20),
          Today(),
          SizedBox(height: 20),
          Water200Button(() {}),
        ],
      ),
    );
  }
}
