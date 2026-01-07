import 'package:flutter/material.dart';
import 'package:tafl_app/model/pos.dart';
import 'package:tafl_app/widget/game/board/piece/game_piece_visual.dart';
import 'package:tafl_app/widget/game/board/game_draggable_piece.dart';


class AnimatedPositionedWidget extends StatelessWidget {

  const AnimatedPositionedWidget({
    super.key, 
    required this.isDraggable,
    required this.isSelectedPiece,
    //required this.boardKey,
    required this.pos, 
    required this.cellW, 
    required this.cellH,
    required this.label,
    //required this.onPieceDropped,
    required this.onAnimationEnd,
    required this.onDragEnd,
  });

  final Pos pos;
  final bool isDraggable;
  final bool isSelectedPiece;
  final String label;
  final double cellW;
  final double cellH;
  //final GlobalKey boardKey;
  //final void Function(int newRow, int newCol) onPieceDropped;
  final void Function(DraggableDetails details) onDragEnd;
  final void Function() onAnimationEnd;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      left: pos.x * cellW,
      top: pos.y * cellH,
      width: cellW,
      height: cellH,
      onEnd: isSelectedPiece ? onAnimationEnd : (){},
      child: DraggablePiece(
        isDraggable: isDraggable,
        onDragEnd: onDragEnd,
        width: cellW,
        height: cellH,
        child: PieceVisual.active(label: label),
      ),
    );
  }
}

class InactiveWidget extends StatelessWidget {

  const InactiveWidget({
    super.key, 
    required this.pos, 
    required this.cellW, 
    required this.cellH,
    required this.label,
    required this.onAnimationEnd,
    this.isCaptured = false,
  });

  final Pos pos;
  final String label;
  final double cellW;
  final double cellH;
  final bool isCaptured;
  final void Function() onAnimationEnd;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos.x * cellW,
      top: pos.y * cellH,
      width: cellW,
      height: cellH,
      child: AnimatedOpacity(
        onEnd: isCaptured ? onAnimationEnd : (){},
        opacity: isCaptured ? 0 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: PieceVisual.inactive(label: label,),
        ),
    );
  }
}
