import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/game_piece.dart';
import 'package:tafl_app/model/game_state.dart';
import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/model/game_turn.dart';
import 'package:tafl_app/model/pos.dart';
import 'package:tafl_app/model/playing_piece.dart';
import 'package:tafl_app/provider/game_turn_provider.dart';
import 'package:tafl_app/provider/game_play_provider.dart';
import 'package:tafl_app/data/prohibited_positions.dart';

const List<Pos> directions = [
  (x: 1, y: 0),
  (x: -1, y: 0),
  (x: 0, y: 1),
  (x: 0, y: -1),
];

class GameController extends Notifier<GameState>
{
  List<String> pendingCapturedIds = [];

  @override
  GameState build() => GameState.initial();

  void declareWinner(GameTeam team) {
    state = state.copyWith(winner: team);
  }

  void clearWinnerEvent() {
    state = state.copyWith(winner: null);
  }

  void requestRestart() {
    state = state.copyWith(restart: true);
  }

  void clearRestartEvent() {
    state = state.copyWith(restart: false);
  }

  bool _reviewRuleMove(PlayingPiece piece, Pos toPos) {

    if (piece.pos == toPos) {
      return false;
    }

    if (piece.piece.type != GamePieceType.king && prohibitedPositions.contains(toPos)) {
      return false;
    } 
    
    List<PlayingPiece> pieces = ref.read(gamePlayProvider);
    List<Pos> occupiedPositions = (pieces.where((p)=>(p!=piece))).map((p) => p.pos).toList();

    if (occupiedPositions.contains(toPos)) {
      return false;
    } 

    if(piece.pos.y == toPos.y) {
      // Check if path is clear in x direction
      int step = (toPos.x - piece.pos.x).sign;
      for(int x = piece.pos.x + step; x != toPos.x; x += step) {
        if(occupiedPositions.contains((x: x, y: piece.pos.y))) {
          return false;
        }
        if (piece.piece.type != GamePieceType.king && prohibitedThronePosition == (x: x, y: piece.pos.y)) {
          return false;
        }
      }
      return true;
    }

    if(piece.pos.x == toPos.x) {
      // Check if path is clear in y direction
      int step = (toPos.y - piece.pos.y).sign;
      for(int y = piece.pos.y + step; y != toPos.y; y += step) {
        if(occupiedPositions.contains((x: piece.pos.x, y: y))) {
          return false;
        }
        if (piece.piece.type != GamePieceType.king && prohibitedThronePosition == (x: piece.pos.x, y: y)) {
          return false;
        }
      }
      return true;
    }

    // Add any additional game rules for moving pieces here if needed
    return false;
  }

  void move(PlayingPiece piece, Pos toPos) {

    if (!_reviewRuleMove(piece, toPos)) {
      return;
    }

    piece.moveTo(toPos);
    ref.read(gameTurnProvider.notifier).move(piece);
  }

  bool endGame() {
    List<PlayingPiece> pieces = ref.read(gamePlayProvider);

    bool kingCaptured = pieces.where((p) => p.piece.type == GamePieceType.king).isEmpty;
    
    bool kingEscaped = pieces.where((p) => p.piece.type == GamePieceType.king && prohibitedCornersPosition.contains(p.pos)).isNotEmpty;

    return kingCaptured || kingEscaped;
  }

  List<PlayingPiece> _capture(final PlayingPiece piece)
  {
    List<PlayingPiece> captured = [];

    List<PlayingPiece> pieces = ref.read(gamePlayProvider);
    List<PlayingPiece> ennemies = pieces.where((p) => p.piece.team != piece.piece.team).toList();
    List<PlayingPiece> allies = pieces.where((p) => p.piece.team == piece.piece.team).toList();

    final List<Pos> adjacentPositions = directions.map((d) => (x: piece.pos.x + d.x, y: piece.pos.y + d.y)).toList();
    List<PlayingPiece> adjacentEnemies = ennemies.where((p) => adjacentPositions.contains(p.pos)).toList();

    List<Pos> hostilePositions = prohibitedPositions.where((p)=>!pieces.any((piece) => piece.pos == p)).toList();

    for (final enemy in adjacentEnemies) {
      Pos direction = (x: enemy.pos.x - piece.pos.x, y: enemy.pos.y - piece.pos.y);
      Pos checkPos = (x: enemy.pos.x + direction.x, y: enemy.pos.y + direction.y);

      bool isCaptured = false;

      if (enemy.piece.type == GamePieceType.king) {

        final List<Pos> kingAdjacentPositions = directions.map((d) => (x: enemy.pos.x + d.x, y: enemy.pos.y + d.y)).toList();
        int count = 0;
        
        for (final pos in kingAdjacentPositions) {
          bool occupiedByAlly = allies.any((p) => p.pos == pos);
          if (occupiedByAlly || prohibitedPositions.contains(pos)) {
            count += 1;
          }
          else if (pos.x < 0 || pos.y < 0 || pos.x >= 11 || pos.y >= 11) {
            count += 1;
          }
        }

        isCaptured = (count >= 4);

      } else {
        // Regular piece capture rules
        bool surroundedByAllies = allies.any((p) => p.pos == checkPos);
        if (surroundedByAllies || hostilePositions.contains(checkPos)) {
          isCaptured = true;
        }
      }

      if (isCaptured) {
        captured.add(enemy);
      }
    }

    return captured;
  }

  List<PlayingPiece> _reviewCheckMate() {

    final PlayingPiece piece = ref.read(gameTurnProvider).selectedPiece!;

    List<PlayingPiece> captured = _capture(piece);

    //TODO manage sacrifice 

    return captured;
  }

  void capture() {
    List<PlayingPiece> capturedPieces = ref.read(gameTurnProvider).capturedPieces;

    if (capturedPieces.isNotEmpty)
    {
      return;
    }

    capturedPieces = _reviewCheckMate();
    if (capturedPieces.isEmpty) {
      nextTurn();
      return;
    }
    else {
      assert(pendingCapturedIds.isEmpty);
      pendingCapturedIds = capturedPieces.map((piece)=>piece.id).toList();
      ref.read(gameTurnProvider.notifier).capture(capturedPieces);
    }
    
  }

  void onCapture(String id)
  {
    pendingCapturedIds.removeWhere((i)=> (i== id));
    if (pendingCapturedIds.isEmpty){
      nextTurn();
      return;
    }
  }

  void nextTurn() {
    ref.read(gamePlayProvider.notifier).removePieces(
      ref.read(gameTurnProvider).capturedPieces
    );
    if (endGame()) {
      GameTurn currentTurn = ref.read(gameTurnProvider);
      GameTeam winner = currentTurn.activeTeam;
      state = state.copyWith(winner: winner); 
      return;
    }
    ref.read(gameTurnProvider.notifier).nextTurn();
  }

  void resetGame() {

  }

}