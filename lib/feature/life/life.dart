import 'package:flutter/material.dart';
import 'package:routine_builder/feature/life/life_detail/life_detail.dart';
import "package:routine_builder/general/model/life.dart" as model;

class Life extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LifeDetail(model.Life.initDev()),
    );
  }
}
