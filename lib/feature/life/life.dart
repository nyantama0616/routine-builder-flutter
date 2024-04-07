import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/life/hook/use_life.dart';
import 'package:routine_builder/feature/life/life_detail/life_detail.dart';

class Life extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useLife();
    return Center(
      child: LifeDetail(controller.life),
    );
  }
}
