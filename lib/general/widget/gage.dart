import 'package:flutter/material.dart';

class Gage extends StatelessWidget {
  final double progress;
  final Color color;
  final double width;
  final double height;

  Gage(this.progress, {required this.color, this.width = 200, this.height = 300});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.grey,
          ),
          Container(
            width: width,
            height: height,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height * progress,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
