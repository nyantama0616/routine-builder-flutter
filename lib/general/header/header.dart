import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  static const height = 100.0;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).primaryColor;

    return Container(
      height: height,
      color: backgroundColor,
      child: const Center(
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
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
