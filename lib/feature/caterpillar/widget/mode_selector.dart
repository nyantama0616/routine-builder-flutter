import 'package:flutter/material.dart';
import 'package:routine_builder/feature/caterpillar/class/mode.dart';
import 'package:routine_builder/feature/caterpillar/widget/progress_bar.dart';

const GOAL = 120; //各パターン120分を目指そう

class ModeSelector extends StatelessWidget {
  ModeSelector({super.key});

  final modes = _getPermutations("1234").map((pattern) {
    final mode = Mode(pattern: pattern, minutes: 55);
    final progress = mode.minutes / GOAL;
    return Material(
        color: Color.fromARGB(255, 193, 212, 247),
        child: InkWell(
          onTap: () {},
          child: ListTile(
            title: Text(pattern),
            subtitle: ProgressBar(progress: progress),
            leading: Icon(Icons.music_note),
            trailing: Text("${mode.minutes}/$GOAL(分)",
                style: TextStyle(fontSize: 12)),
          ),
        ));
  }).toList();

  @override
  Widget build(BuildContext context) {
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
