import 'package:flutter/material.dart';

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
            subtitle: _ProgressBar(progress: progress),
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

class _ProgressBar extends StatelessWidget {
  final double progress;
  _ProgressBar({
    super.key,
    required this.progress,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              height: 2,
              width: constraints.maxWidth, // 親要素の幅に対する相対的な幅
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            );
          },
        ),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              height: 2,
              width: constraints.maxWidth * progress,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            );
          },
        )
      ],
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

class Mode {
  final String pattern;
  final int minutes;
  Mode({
    required this.pattern,
    required this.minutes,
  });
}
