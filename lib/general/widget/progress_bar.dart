import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  ProgressBar({
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
