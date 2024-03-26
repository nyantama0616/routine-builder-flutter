import 'package:flutter/material.dart';

final Water200Button = (Function()? onPressed) =>
    _ButtonBase("水", 200, onPressed: onPressed, icon: Icons.local_drink);

class _ButtonBase extends StatelessWidget {
  final String name;
  final int xml;
  final IconData icon;
  final Color textColor;
  final Color backgroundColor;
  final Function()? onPressed;

  _ButtonBase(this.name, this.xml,
      {
        super.key,
        required this.icon,
        this.onPressed,
        this.textColor = Colors.white,
        this.backgroundColor = Colors.blue
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // ここで幅を設定します
      height: 80, // ここで高さを設定します
      child: FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(name, style: TextStyle(color: textColor)),
            Text("${xml}ml", style: TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }
}
