import 'package:tafl_app/model/pos.dart';

final List<Pos> attackerStartingPositions13 = [
  // Top
 (x: 0, y: 4), (x: 0, y: 5), (x: 0, y: 6), (x: 0, y: 7),(x: 0, y: 8),
  (x: 1, y: 6),

  // Left
  (x: 4, y: 0), (x: 5, y: 0), (x: 6, y: 0), (x: 7, y: 0),(x: 8, y: 0), 
  (x: 6, y: 1),

  // Bottom
  (x: 12, y: 4), (x: 12, y: 5), (x: 12, y: 6), (x: 12, y: 7),(x: 12, y: 8),
  (x: 11, y: 5),

  // Right
  (x: 3, y: 12), (x: 4, y: 12), (x: 5, y: 12), (x: 6, y: 12), (x: 7, y: 12),
  (x: 6, y: 10),
];

final List<Pos> defenderStartingPositions13 = [
  (x: 6, y: 3),
  (x: 6, y: 4),
  (x: 6, y: 5),

  (x: 6, y: 7),
  (x: 6, y: 8),
  (x: 6, y: 9),

  (x: 3, y: 6),
  (x: 4, y: 6),
  (x: 5, y: 6),

  (x: 7, y: 6),
  (x: 8, y: 6),
  (x: 9, y: 6),
];

final Pos kingStartingPosition13 = (x: 6, y: 6);