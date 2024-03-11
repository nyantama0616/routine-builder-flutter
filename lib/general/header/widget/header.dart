import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_builder/general/header/widget/header_status.dart';
import 'package:routine_builder/general/header/widget/header_title.dart';

class Header extends ConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});
  static const height = 100.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color backgroundColor = Theme.of(context).primaryColor;

    return Container(
      height: height,
      color: backgroundColor,
      child: Container(
          height: height,
          color: backgroundColor,
          child: const Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: HeaderTitle(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: HeaderStatus(),
              ),
            ],
          ),
          )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
