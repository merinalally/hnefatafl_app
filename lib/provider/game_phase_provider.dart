import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/game_turn.dart';
import 'package:tafl_app/model/playing_piece.dart';

class GameTurnNotifier extends Notifier<GameTurn> {
  @override
  GameTurn build() => GameTurn.init();
  void move(PlayingPiece piece){
    state = GameTurn.move(piece, state);
  }
  void capture(List<PlayingPiece> capturedPieces){
    state = GameTurn.capture(capturedPieces, state);  
  }
  void nextTurn(){
    state = GameTurn.nextTurn(state); 
  }
}

final gameTurnProvider = NotifierProvider<GameTurnNotifier,GameTurn>(GameTurnNotifier.new);