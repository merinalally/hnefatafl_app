import 'package:tafl_app/model/game_team.dart';

enum GamePieceType {
  attacker,
  defender,
  king,
}

sealed class GamePiece {

  final GameTeam team;
  final GamePieceType type;

  GamePiece({
    required this.team,
    required this.type,
  });
}

class King extends GamePiece {
  King() : super(team: GameTeam.defender, type: GamePieceType.king);
}

class Attacker extends GamePiece {
  Attacker() : super(team: GameTeam.attacker, type: GamePieceType.attacker);
} 

class Defender extends GamePiece {
  Defender() : super(team: GameTeam.defender, type: GamePieceType.defender);
} 