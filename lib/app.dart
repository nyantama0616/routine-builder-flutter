import 'package:flutter/material.dart';
import 'package:routine_builder/feature/sleep/widget/sleep.dart';
import 'package:routine_builder/general/header/widget/header.dart';
import 'package:routine_builder/feature/sleep/widget/sleep.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routine Builder',
      //TODO: Themeについて調べる
      theme: ThemeData(
        primaryColor: Colors.black,
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: Scaffold(
          appBar: Header(),
          body: Sleep(),
        ),
      ),
    );
  }
}
