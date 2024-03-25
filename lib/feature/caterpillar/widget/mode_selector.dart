import 'package:flutter/material.dart';
import 'package:routine_builder/feature/caterpillar/widget/progress_bar.dart';
import 'package:routine_builder/general/class/caterpillar.dart';
import 'package:routine_builder/feature/caterpillar/class/caterpillar_controller.dart';

const GOAL_MINUTES = 120; //各パターン120分を目指そう

class ModeSelector extends StatelessWidget {
  final CaterpillarController controller;
  ModeSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final modes = controller.patterns.entries.map((entry) {
      final pattern = entry.key;
      final passedSeconds = entry.value;
      final mode = Caterpillar(pattern: pattern, passedSeconds: passedSeconds);
      final passedMinutes = mode.passedSeconds ~/ 60;
      final progress = passedMinutes / GOAL_MINUTES;
      return Material(
          color: Color.fromARGB(255, 193, 212, 247),
          child: InkWell(
            onTap: () {
              controller.selectMode(mode);
            },
            child: ListTile(
              title: Text(pattern),
              subtitle: ProgressBar(progress: progress),
              leading: Icon(Icons.music_note),
              trailing: Text("${passedMinutes}/$GOAL_MINUTES(分)",
                  style: TextStyle(fontSize: 12)),
            ),
          ));
    }).toList();
    
    return Center(
      child: Container(
        height: 400,
        width: 250,
        child: ListView.separated(
          itemCount: modes.length,
          itemBuilder: (context, index) => modes[index],
          separatorBuilder: (context, index) => Divider(
            color: Colors.white,
            height: 0,
          ),
        ),
      ),
    );
  }
}

List<String> _getPermutations(String str) {
  if (str.length <= 1) {
    return [str];
  } else {
    var result = <String>[];
    for (var i = 0; i < str.length; i++) {
      var firstChar = str[i];
      var otherChar = str.substring(0, i) + str.substring(i + 1);
      var otherPermutations = _getPermutations(otherChar);
      for (var permutation in otherPermutations) {
        result.add(firstChar + permutation);
      }
    }
    return result;
  }
}
