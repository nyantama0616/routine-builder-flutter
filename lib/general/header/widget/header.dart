import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routine_builder/general/enum/scenes.dart';
import 'package:routine_builder/general/header/widget/header_status.dart';
import 'package:routine_builder/general/header/widget/header_title.dart';
import 'package:routine_builder/general/provider/app_provider.dart';

class Header extends HookConsumerWidget implements PreferredSizeWidget {
  const Header({super.key});
  static const height = 100.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color backgroundColor = Theme.of(context).primaryColor;
    final appController = ref.watch(appProvider.notifier);
    final homeButton = Container(
      width: 80, // ここで幅を設定します
      height: 80, // ここで高さを設定します
      child: IconButton(
        icon: const Icon(Icons.home),
        color: Colors.white,
        onPressed: () {
          appController.setScene(Scenes.home);
        },
      ),
    );

    return Container(
      height: height,
      color: backgroundColor,
      child: Container(
          height: height,
          color: backgroundColor,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: homeButton,
              ),
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
