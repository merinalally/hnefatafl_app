import 'package:tafl_app/model/pos.dart';

enum GamePlayType {
  size_7,
  size_11, 
  size_13, 
  size_15, 
}

class GamePlay {
  GamePlay({
    required this.size,
    required this.attackerStartingPositions,
    required this.defenderStartingPositions,
    required this.kingStartingPosition,
  });

  final int size;
  final List<Pos> attackerStartingPositions;
  final List<Pos> defenderStartingPositions;
  final Pos kingStartingPosition;
}