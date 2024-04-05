import 'package:flutter/material.dart';

final CrossButton = ({Function()? onTap}) => IconButton(
      icon: Icon(Icons.close),
      onPressed: onTap ?? () {},
    );

final AddButton = ({Function()? onTap, Color? color = Colors.blue}) => IconButton(
      icon: Icon(Icons.add, color: color),
      onPressed: onTap ?? () {},
    );

final RemoveButton = ({Function()? onTap, Color? color = Colors.red}) => IconButton(
      icon: Icon(Icons.remove_circle_outline, color: color),
      onPressed: onTap ?? () {},
    );
