import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/model/playing_piece.dart';

enum GameAnimation {
  none,
  move,
  capture,
}

class GameTurn {
  //final int idTurn;
  final GameTeam activeTeam;
  final PlayingPiece? selectedPiece;
  final List<PlayingPiece> capturedPieces;

  const GameTurn._({
    required this.activeTeam,
    required this.selectedPiece,
    required this.capturedPieces,
    
  });

  factory GameTurn.init() => const GameTurn._(
      activeTeam: GameTeam.attacker,
      selectedPiece: null,
      capturedPieces: <PlayingPiece>[],
    );

  GameTurn move(PlayingPiece piece) => GameTurn._(
        activeTeam: activeTeam,
        selectedPiece: piece,
        capturedPieces: const <PlayingPiece>[],
      );
  
  GameTurn capture(List<PlayingPiece> newCapturedPieces) => GameTurn._(
        activeTeam: activeTeam,
        selectedPiece: selectedPiece,
        capturedPieces: newCapturedPieces,
      );

    GameTurn nextTurn() => GameTurn._(
        activeTeam: activeTeam == GameTeam.attacker ? GameTeam.defender : GameTeam.attacker,
        selectedPiece: null,
        capturedPieces: const <PlayingPiece>[],
      );

}