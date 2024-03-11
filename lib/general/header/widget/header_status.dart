import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_builder/general/provider/user_provider.dart';
import 'package:routine_builder/general/enum/statuses.dart';
import 'package:flutter/material.dart';

class HeaderStatus extends ConsumerWidget {
  const HeaderStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final icon = user.status == Statuses.sleeping ? Icons.bedtime : null;
    final text = user.status == Statuses.none ? "" : user.status.rawValue;

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
