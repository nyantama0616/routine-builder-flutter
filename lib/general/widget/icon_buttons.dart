import 'package:flutter/material.dart';

final CrossButton = ({Function()? onTap}) => IconButton(
      icon: Icon(Icons.close),
      onPressed: onTap ?? () {},
    );

final AddButton = ({Function()? onTap}) => IconButton(
      icon: Icon(Icons.add),
      onPressed: onTap ?? () {},
    );
