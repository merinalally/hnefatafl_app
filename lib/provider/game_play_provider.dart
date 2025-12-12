import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/playing_piece.dart';
import 'package:tafl_app/model/pos.dart';
import 'package:tafl_app/data/initial_positions.dart';

class GamePlayNotifier extends Notifier<List<PlayingPiece>> {
  @override
  List<PlayingPiece> build()
  {
    List<PlayingPiece> attackers = attackerStartingPositions
        .map((pos) => PlayingPieceFactory.createAttacker(pos))
        .toList();
    List<PlayingPiece> defenders = defenderStartingPositions
        .map((pos) => PlayingPieceFactory.createDefender(pos))
        .toList();
    PlayingPiece king = PlayingPieceFactory.createKing(kingStartingPosition); 
    return [...attackers, ...defenders, king];
  }

  void movePiece(PlayingPiece piece, Pos toPos) {
    state = [
      for (final p in state)
        if (p.id == piece.id)
          PlayingPiece(
            piece: p.piece,
            pos: toPos,
          )
        else
          p,
    ];
  }

  void removePieces(List<PlayingPiece> piecesToRemove) {
    state = state.where((p) => !piecesToRemove.any((r) => r.id == p.id)).toList();
  }

}

final gamePlayProvider = NotifierProvider<GamePlayNotifier,List<PlayingPiece>>(GamePlayNotifier.new);
/*
class GamePlayNotifier extends Notifier<List<Pos>> {
  @override
  List<Pos> build() => [];

  void init(List<Pos> initialPositions) {
    state = initialPositions;
  }

  void movePiece(int index, int newX, int newY) {
    state = [
      for (final entry in state)
        if (state.indexOf(entry) == index)
          (x: newX, y: newY)
        else
          entry,
    ];
  }
}

class KingPosNotifier extends Notifier<Pos> {
  @override
  Pos build() => (x: 5, y: 5);

  void init(Pos initialPosition) {
    state = initialPosition;
  }

  void moveKing(int newX, int newY) {
    state = (x: newX, y: newY);
  }
}


final attackersProvider = NotifierProvider<GamePlayNotifier,List<Pos>>(GamePlayNotifier.new);
final defendersProvider = NotifierProvider<GamePlayNotifier,List<Pos>>(GamePlayNotifier.new);
final kingPosProvider = NotifierProvider<KingPosNotifier,Pos>(KingPosNotifier.new);


final Map<GameTeam, NotifierProvider<GamePlayNotifier,List<Pos>>> playerMovesProvider = {
  GameTeam.attacker: attackersProvider,
  GameTeam.defender: defendersProvider,
};


GamePlayNotifier notifierFor(WidgetRef ref, GameTeam team) =>
  ref.read(playerMovesProvider[team]!.notifier);
  
*/
