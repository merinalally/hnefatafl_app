import 'package:flutter/material.dart';

class GameCell extends StatelessWidget {
  final IconData icon;

  const GameCell({super.key, required this.icon});
  const GameCell.throne({super.key}) : icon = Icons.account_balance;
  const GameCell.cross({super.key}) : icon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }

}