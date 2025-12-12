import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/pos.dart';
import 'package:tafl_app/model/game_piece.dart';
import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/model/game_turn.dart';
import 'package:tafl_app/model/playing_piece.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/provider/game_play_provider.dart';
import 'package:tafl_app/provider/game_phase_provider.dart';
import 'package:tafl_app/widget/grid_board_painter.dart';
import 'package:tafl_app/widget/active_widget.dart';
import 'package:tafl_app/data/game_cell_stickers.dart';


/// Basic board view: static board (CustomPaint) + one draggable piece on top.
/// The piece snaps to the nearest cell when you drop it.
class GameBoardView extends ConsumerStatefulWidget {

  const GameBoardView({super.key, this.rows = 11, this.cols = 11});
  final int rows;
  final int cols;

  @override
  ConsumerState<GameBoardView> createState() => _BoardViewState();
}

class _BoardViewState extends ConsumerState<GameBoardView> {
  // We’ll use this key to convert global drag offsets to local board coords.

  final GlobalKey _boardKey = GlobalKey();

  Pos _getPos(DraggableDetails details, double cellW, double cellH) {
    final boardBox = _boardKey.currentContext?.findRenderObject() as RenderBox?;
    if (boardBox == null) return (x: 0, y: 0);

    final boardTopLeft = boardBox.localToGlobal(Offset.zero);
    final localDrop = details.offset - boardTopLeft;

    // Compute row/col from local offset
    int newCol = (localDrop.dx / cellW).round();
    int newRow = (localDrop.dy / cellH).round();

    int clampedCol = newCol.clamp(0, widget.cols - 1);
    int clampedRow = newRow.clamp(0, widget.rows - 1);      

    return (x: clampedCol, y: clampedRow,);
  }

  @override
  Widget build(BuildContext context) {

    final gameController = ref.read(gameControllerProvider.notifier);

    final currentPlay = ref.watch<GameTurn>(gameTurnProvider);

    final pieces = ref.read(gamePlayProvider);
    final activePlayer = currentPlay.activeTeam;
    final List<PlayingPiece> capturedPieces = currentPlay.capturedPieces;
    final PlayingPiece? selectedPiece = currentPlay.selectedPiece;

    // Keep it square and responsive.
    return AspectRatio(
      aspectRatio: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {

          final size = constraints.biggest.shortestSide;
          final boardSize = Size.square(size);
          final cellW = boardSize.width / widget.cols;
          final cellH = boardSize.height / widget.rows;

          return SizedBox(
            width: boardSize.width,
            height: boardSize.height,
            child: Stack(
              children: [
                // --- BOARD LAYER (static) ---
                RepaintBoundary(
                  child: CustomPaint(
                    key: _boardKey,
                    size: boardSize,
                    painter: GridBoardPainter(
                      rows: widget.rows,
                      cols: widget.cols,
                    ),
                  ),
                ),
                
                // Dans ton Stack, après le CustomPaint du board :
                ...specialCellStickers.map((sticker) {
                  return Positioned(
                    left: sticker.indexX * cellW,
                    top: sticker.indexY * cellH,
                    width: cellW,
                    height: cellH,
                    child: Center(
                      child: sticker.buildWidget(cellW * 0.6),
                    ),
                  );
                }),

                // --- PIECE LAYER (dynamic) ---
                ...pieces.map((piece) {
                  GameTeam team = piece.piece.team;
                  GamePieceType type = piece.piece.type;
                  String label = (team == GameTeam.attacker) ? 'A' : (type == GamePieceType.king) ? 'K' : 'D';
                  if(team == activePlayer)
                  {
                    Widget activeWidget = AnimatedPositionedWidget(
                      //boardKey: _boardKey,
                      pos: piece.pos,
                      isDraggable: (selectedPiece!= null),
                      cellW: cellW,
                      cellH: cellH,
                      label: label,
                      onAnimationEnd: ()
                      {
                        // TODO manage multiple captures
                        gameController.capture();
                      },
                      onDragEnd: (details) {
                        final newPos = _getPos(details, cellW, cellH);
                        gameController.move(piece, newPos);
                      },
                    );
                    return activeWidget;
                  }
                  return InactiveWidget(
                    pos: piece.pos,
                    cellW: cellW,
                    cellH: cellH,
                    label: label,
                    isCaptured: capturedPieces.contains(piece),
                    onAnimationEnd: () {
                      gameController.nextTurn();
                    },
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}