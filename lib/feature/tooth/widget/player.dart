import 'package:flutter/widgets.dart';
import 'package:routine_builder/general/widget/counter.dart';
import 'package:routine_builder/general/widget/counter_submit_button.dart';

class Player extends StatelessWidget {
  Player({super.key});

  @override
  Widget build(BuildContext context) {
    final startButton = StartButton(() {});
    final stopButton = StopButton(() {});
    final submitButton = startButton;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Counter(0),
          SizedBox(height: 10),
          submitButton,
        ],
      ),
    );
  }
}
