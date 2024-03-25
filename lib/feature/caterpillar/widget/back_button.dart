import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final Function()? onPressed;

  BackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: onPressed,
    );
  }
}
