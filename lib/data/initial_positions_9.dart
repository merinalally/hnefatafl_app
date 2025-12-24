import 'package:tafl_app/model/pos.dart';
import 'package:tafl_app/model/game_play.dart';

final List<Pos> attackerStartingPositions7 = [
  // Top
  (x: 0, y: 3), (x: 0, y: 4), (x: 0, y: 5), (x: 0, y: 6), (x: 0, y: 7),
  (x: 1, y: 5),

  // Left
  (x: 3, y: 0), (x: 4, y: 0), (x: 5, y: 0), (x: 6, y: 0), (x: 7, y: 0),
  (x: 5, y: 1),

  // Bottom
  (x: 10, y: 3), (x: 10, y: 4), (x: 10, y: 5), (x: 10, y: 6), (x: 10, y: 7),
  (x: 9, y: 5),

  // Right
  (x: 3, y: 10), (x: 4, y: 10), (x: 5, y: 10), (x: 6, y: 10), (x: 7, y: 10),
  (x: 5, y: 9),
];

final List<Pos> defenderStartingPositions7 = [
  (x: 5, y: 3),
  (x: 5, y: 4),
  (x: 5, y: 6),
  (x: 5, y: 7),

  (x: 3, y: 5),
  (x: 4, y: 5),
  (x: 6, y: 5),
  (x: 7, y: 5),

  (x: 4, y: 4),
  (x: 4, y: 6),
  (x: 6, y: 4),
  (x: 6, y: 6),
];

final Pos kingStartingPosition7 = (x: 3, y: 3);

final GamePlay gamePlay7 = GamePlay(
  size: 7,
  attackerStartingPositions: attackerStartingPositions7,
  defenderStartingPositions: defenderStartingPositions7,
  kingStartingPosition: kingStartingPosition7,
);