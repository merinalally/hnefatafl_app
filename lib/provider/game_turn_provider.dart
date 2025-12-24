import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/game_turn.dart';
import 'package:tafl_app/model/playing_piece.dart';

class GameTurnNotifier extends Notifier<GameTurn> {
  @override
  GameTurn build() => GameTurn.init();

  void move(PlayingPiece piece){
    state = state.move(piece);
  }
  void capture(List<PlayingPiece> capturedPieces){
    state = state.capture(capturedPieces);  
  }
  void nextTurn(){
    state = state.nextTurn();
  }
}

final gameTurnProvider = NotifierProvider<GameTurnNotifier,GameTurn>(GameTurnNotifier.new);