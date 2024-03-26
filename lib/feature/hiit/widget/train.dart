import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:routine_builder/feature/hiit/widget/buttons.dart';

class Train extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final subWidget = _Info();
    final subWidget = StartButton(() => print("start"));
    return Column(
      children: [
        _Gage(0.3, color: Colors.green),
        SizedBox(height: 20,),
        subWidget,
      ],
    );
  }
}

class _Gage extends StatelessWidget {
  final double progress;
  final Color color;
  
  _Gage(this.progress, {required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 300,
            color: Colors.grey,
          ),
          Container(
            width: 200,
            height: 300,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 300 * 0.4,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("3/10", style: TextStyle(fontSize: 36));
  }
}
