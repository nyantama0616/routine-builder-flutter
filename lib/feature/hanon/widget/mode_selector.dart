import 'package:flutter/material.dart';
import 'package:routine_builder/general/widget/progress_bar.dart';
import 'package:routine_builder/general/class/hanon.dart';
import 'package:routine_builder/feature/hanon/settings.dart';

class ModeSelector extends StatelessWidget {
  ModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: _SongSelector(),
      child: _PatternSelector(),
    );
  }
}

class _SongSelector extends StatelessWidget {
  _SongSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 250,
        child: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) => SongHeader(num: index + 1),
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

  SongHeader({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 193, 212, 247),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text("第$num番"),
          leading: Icon(Icons.music_note),
        ),
      ),
    );
  }
}

class _PatternSelector extends StatelessWidget {
  _PatternSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 250,
        child: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) => PatternHeader(Hanon(
            num: index + 1,
            pattern: "1:CM",
            passedSeconds: 30*60,
          )),
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

  PatternHeader(
    this.hanon,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    final passedMinutes = hanon.passedSeconds ~/ 60;
    final progress = passedMinutes / PATTERN_GOAL_MINUTES;

    return Material(
      color: Color.fromARGB(255, 193, 212, 247),
      child: InkWell(
        onTap: () {},
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
