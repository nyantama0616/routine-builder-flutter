import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routine_builder/feature/dev/ping/widget/ping.dart';
import 'package:routine_builder/feature/home/widget/home.dart';
import 'package:routine_builder/feature/sleep/widget/sleep.dart';
import 'package:routine_builder/general/enum/scenes.dart';
import 'package:routine_builder/general/header/widget/header.dart';
import 'package:routine_builder/feature/caterpillar/widget/caterpillar.dart';
import 'package:routine_builder/general/provider/app_provider.dart';

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
      default:
        mainScreen = Caterpillar();
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
