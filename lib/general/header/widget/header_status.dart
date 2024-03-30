import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_builder/general/provider/app_provider.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:flutter/material.dart';

class HeaderStatus extends ConsumerWidget {
  const HeaderStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(appProvider).todayLife.status;
    final icon = iconFromStatus(status);
    final text = status == Statuses.none ? "" : status.rawValue;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

IconData? iconFromStatus(Statuses status) {
  switch (status) {
    case Statuses.sleep:
      return Icons.bedtime;
    case Statuses.nap:
      return Icons.bedroom_baby;
    case Statuses.caterpillar:
      return Icons.bug_report;
    case Statuses.hanon:
      return Icons.piano;
    case Statuses.tooth:
      return Icons.local_hospital;
    default:
      return null;
  }
}
