import 'package:tafl_app/model/pos.dart';

const Pos prohibitedThronePosition = (x: 5, y: 5);

const List<Pos> prohibitedCornersPosition = [
  (x: 0, y: 0),
  (x: 0, y: 10),
  (x: 10, y: 0), 
  (x: 10, y: 10),
];

final List<Pos> prohibitedPositions = [
  ...prohibitedCornersPosition,
  prohibitedThronePosition,
];