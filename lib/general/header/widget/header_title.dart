import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Routine Builder',
            style: TextStyle(
                color: Colors.white, fontSize: 38, fontFamily: "Whisper"),
          ),
          Text(
            '習慣が未来を創る',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "ShipporiMincho"),
          ),
        ],
      ),
    );
  }
}
