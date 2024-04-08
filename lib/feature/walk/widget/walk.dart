import 'package:flutter/material.dart';
import 'package:routine_builder/feature/walk/home/widget/home.dart';
import 'package:routine_builder/feature/walk/work/widget/work.dart';

class Walk extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Center(
      // child: Home(),
      child: Work(),
    );
  }
}
