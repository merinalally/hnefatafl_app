import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/model/playing_piece.dart';

enum GameAnimation {
  none,
  move,
  capture,
}

class GameTurn {
  final GameTeam activeTeam;
  final PlayingPiece? selectedPiece;
  final List<PlayingPiece> capturedPieces;

  GameTurn({
    required this.activeTeam,
    required this.selectedPiece,
    required this.capturedPieces,
  });

  GameTurn.init()
      : activeTeam = GameTeam.attacker,
        selectedPiece = null,
        capturedPieces = [];

  GameTurn.move(PlayingPiece piece, GameTurn previousTurn)
      : activeTeam = previousTurn.activeTeam,
        selectedPiece = piece,
        capturedPieces = previousTurn.capturedPieces;
  
  GameTurn.capture(List<PlayingPiece> newCapturedPieces, GameTurn previousTurn)
      : activeTeam = previousTurn.activeTeam,
        selectedPiece = previousTurn.selectedPiece,
        capturedPieces = [...previousTurn.capturedPieces, ...newCapturedPieces];

  GameTurn.nextTurn(GameTurn previousTurn) :
      activeTeam = previousTurn.activeTeam == GameTeam.attacker ? GameTeam.defender : GameTeam.attacker,
      selectedPiece = null,
      capturedPieces = [];
  

}