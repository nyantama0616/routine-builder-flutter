import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routine_builder/feature/life/life.dart';
import 'package:routine_builder/feature/walk/widget/walk.dart';
import 'package:routine_builder/general/provider/app_provider.dart';
import 'package:routine_builder/feature/dev/ping/widget/ping.dart';
import 'package:routine_builder/feature/home/widget/home.dart';
import 'package:routine_builder/feature/sleep/widget/sleep.dart';
import 'package:routine_builder/general/enum/scenes.dart';
import 'package:routine_builder/general/header/widget/header.dart';
import 'package:routine_builder/feature/caterpillar/widget/caterpillar.dart';
import 'package:routine_builder/feature/water/widget/water.dart';
import 'package:routine_builder/feature/hiit/widget/hiit.dart';
import 'package:routine_builder/feature/hanon/widget/hanon.dart';
import 'package:routine_builder/feature/tooth/widget/tooth.dart';
import 'package:routine_builder/feature/food_cost/widget/food_cost.dart';


class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);
    final Widget? mainScreen;
    switch (state.scene) {
      case Scenes.home:
        mainScreen = Home();
        break;
      case Scenes.sleep:
        mainScreen = Sleep();
        break;
      case Scenes.ping:
        mainScreen = Ping();
        break;
      case Scenes.caterpillar:
        mainScreen = Caterpillar();
        break;
      case Scenes.hiit:
        mainScreen = Hiit();
        break;
      case Scenes.water:
        mainScreen = Water();
        break;
      case Scenes.hanon:
        mainScreen = Hanon();
        break;
      case Scenes.tooth:
        mainScreen = Tooth();
        break;
      case Scenes.foodCost:
        mainScreen = FoodCost();
        break;
      case Scenes.life:
        mainScreen = Life();
        break;
      case Scenes.walk:
        mainScreen = Walk();
        break;
      default:
        mainScreen = Home();
    }

    return MaterialApp(
      title: 'Routine Builder',
      //TODO: Themeについて調べる
      theme: ThemeData(
        primaryColor: Colors.black,
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: const Header(),
          body: mainScreen,
        ),
      ),
    );
  }
}
