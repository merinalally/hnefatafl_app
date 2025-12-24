import 'package:tafl_app/core/uuid.dart';
import 'package:tafl_app/model/game_piece.dart';
import 'package:tafl_app/model/pos.dart';

class PlayingPiece {

  final String id;
  final GamePiece piece;
  Pos pos;

  PlayingPiece({
    required this.piece,
    required this.pos,
  }): id = uuid.v4();

  void moveTo(Pos newPos) {
    pos = newPos;
  }

}

// Factory constructors for common pieces : King, Attacker, Defender
extension PlayingPieceFactory on GamePiece {

  static PlayingPiece createKing(Pos pos) {
    return PlayingPiece(                                                 
      piece: King(),  
      pos: pos,
    );
  }  

    static PlayingPiece createAttacker(Pos pos) {
    return PlayingPiece(                                                 
      piece: Attacker(),  
      pos: pos,
    );
  }  

  static PlayingPiece createDefender(Pos pos) {
    return PlayingPiece(                                                 
      piece: Defender(),  
      pos: pos,
    );
  }   

}   