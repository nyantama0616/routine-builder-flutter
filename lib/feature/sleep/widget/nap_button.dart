import "package:flutter/material.dart";

import "button_base.dart";

class NapButton extends StatelessWidget {
  final Function()? onPressed;

  const NapButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      text: "昼寝する",
      icon: const Icon(Icons.bedtime_sharp),
      color: Colors.blue,
      onPressed: onPressed,
    );
  }
}
