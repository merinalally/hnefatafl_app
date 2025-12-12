import 'package:flutter/material.dart';
import 'package:tafl_app/model/pos.dart';
import 'package:tafl_app/widget/game_piece_visual.dart';
import 'package:tafl_app/widget/game_draggable_piece.dart';


class AnimatedPositionedWidget extends StatelessWidget {

  const AnimatedPositionedWidget({
    super.key, 
    required this.isDraggable,
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
      onEnd: onAnimationEnd,
      child: DraggablePiece(
        isDraggable: isDraggable,
        // (Optional) give the piece a label/icon; purely visual
        child: PieceVisual(label: label),
        // On drag end, snap to nearest cell
        onDragEnd: onDragEnd,
        /*
        (details) {
          final boardBox = boardKey.currentContext?.findRenderObject() as RenderBox?;
          if (boardBox == null) return;

          final boardTopLeft = boardBox.localToGlobal(Offset.zero);
          final localDrop = details.offset - boardTopLeft;

          // Compute row/col from local offset
          int newCol = (localDrop.dx / cellW).round();
          int newRow = (localDrop.dy / cellH).round();

          onPieceDropped.call(newRow, newCol);
        },*/
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
        onEnd: onAnimationEnd,
        opacity: isCaptured ? 0 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: PieceVisual(label: label,),
        ),
    );
  }
}
