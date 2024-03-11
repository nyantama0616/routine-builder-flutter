import 'package:flutter/material.dart';
import 'package:routine_builder/general/enum/statuses.dart';

//TODO: statusだけをstateにするべきか、User全体をstateにするべきか...
class User {
  final String name;
  ValueNotifier<Statuses> status;

  User({
    required this.name,
    required Statuses status,
  }) : status = ValueNotifier<Statuses>(status);
}
