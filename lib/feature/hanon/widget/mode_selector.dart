import 'package:flutter/material.dart';
import 'package:routine_builder/feature/hanon/controller/hanon_controller.dart';
import 'package:routine_builder/general/class/hanon_patterns.dart';
import 'package:routine_builder/general/widget/progress_bar.dart';
import 'package:routine_builder/general/class/hanon.dart';
import 'package:routine_builder/feature/hanon/settings.dart';

class ModeSelector extends StatelessWidget {
  final HanonController hanonController;
  ModeSelector({super.key, required this.hanonController});

  @override
  Widget build(BuildContext context) {
    final mainScreen = hanonController.hanonNum == null
        ? _SongSelector(hanonController: hanonController)
        : _PatternSelector(hanonController: hanonController);
    return Center(
      child: mainScreen,
    );
  }
}

class _SongSelector extends StatelessWidget {
  final HanonController hanonController;
  _SongSelector({super.key, required this.hanonController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 250,
        child: ListView.separated(
          itemCount: HANON_NUM,
          itemBuilder: (context, index) => SongHeader(num: index + 1, onTap: hanonController.selectHanonNum),
          separatorBuilder: (context, index) => Divider(
            color: Colors.white,
            height: 0,
          ),
        ),
      ),
    );
  }
}

class SongHeader extends StatelessWidget {
  final int num;
  final Function(int)? onTap;

  SongHeader({super.key, required this.num, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 193, 212, 247),
      child: InkWell(
        onTap: () {onTap?.call(num);},
        child: ListTile(
          title: Text("第$num番"),
          leading: Icon(Icons.music_note),
        ),
      ),
    );
  }
}

class _PatternSelector extends StatelessWidget {
  HanonController hanonController;

  _PatternSelector({super.key, required this.hanonController});

  @override
  Widget build(BuildContext context) {
    final hanons = hanonController.patterns[hanonController.hanonNum]!.entries
        .map((entry) {
      final pattern = entry.key;
      final passedSeconds = entry.value;
      final hanon = Hanon(
          num: hanonController.hanonNum!,
          pattern: pattern,
          passedSeconds: passedSeconds);
      return hanon;
    }).toList();

    return Center(
      child: Container(
        height: 400,
        width: 250,
        child: ListView.separated(
          itemCount: hanons.length,
          itemBuilder: (context, i) => PatternHeader(hanons[i], onTap: hanonController.selectHanon),
          separatorBuilder: (context, index) => Divider(
            color: Colors.white,
            height: 0,
          ),
        ),
      ),
    );
  }
}

class PatternHeader extends StatelessWidget {
  final Hanon hanon;
  final Function(Hanon)? onTap;
  PatternHeader(this.hanon, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final passedMinutes = hanon.passedSeconds ~/ 60;
    final progress = passedMinutes / PATTERN_GOAL_MINUTES;

    return Material(
      color: Color.fromARGB(255, 193, 212, 247),
      child: InkWell(
        onTap: () {onTap?.call(hanon);},
        child: ListTile(
          title: Text(hanon.pattern),
          subtitle: ProgressBar(progress: progress),
          leading: Icon(Icons.music_note),
          trailing: Text("${passedMinutes}/$PATTERN_GOAL_MINUTES(分)",
              style: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }
}
