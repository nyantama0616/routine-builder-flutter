import 'package:flutter/material.dart';

final FoodsButton = ({Function()? onTap}) => _MenuButton(
      title: '食品',
      icon: Icons.egg,
      onTap: onTap,
    );

final FoodMenusButton = ({Function()? onTap}) => _MenuButton(
      title: '献立',
      icon: Icons.menu,
      onTap: onTap,
    );

class _MenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;

  _MenuButton({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: Column(
        children: <Widget>[
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}
