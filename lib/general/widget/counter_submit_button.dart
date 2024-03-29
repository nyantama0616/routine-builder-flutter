import 'package:flutter/material.dart';

final StartButton = (VoidCallback? onPressed) => CounterSubmitButton("スタート", icon: Icons.play_arrow, color: Colors.green, onPressed: onPressed);
final StopButton = (VoidCallback? onPressed) => CounterSubmitButton("ストップ", icon: Icons.stop, color: Colors.red, onPressed: onPressed);

class CounterSubmitButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  CounterSubmitButton(this.label, {required this.icon, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(label),
      icon: Icon(icon),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
      ),
    );
  }
}
