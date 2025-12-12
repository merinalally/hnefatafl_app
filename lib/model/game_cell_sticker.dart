import 'package:flutter/material.dart';


sealed class GameCellSticker {

  const GameCellSticker({
    required this.indexX, 
    required this.indexY,
    required this.icon,
  });

  Widget buildWidget(double size){
    return Icon(
        icon,
        color: Colors.black.withValues(alpha: 0.6),
        size: size,
      );
  }

  final int indexX;
  final int indexY;
  final IconData icon;
}

class ThroneSticker extends GameCellSticker {
  const ThroneSticker({
    required int indexX, 
    required int indexY,
  }) : super(
        indexX: indexX, 
        indexY: indexY,
        icon: Icons.account_balance,
      );
}

class CornerSticker extends GameCellSticker {
  const CornerSticker({
    required int indexX, 
    required int indexY,
  }) : super(
        indexX: indexX, 
        indexY: indexY,
        icon: Icons.add,
      );
}