import 'package:flutter/material.dart';

//TODO add an icon for throne and corner squares

/// Draws a simple grid with alternating tiles (like a chess/checkerboard).
class GridBoardPainter extends CustomPainter {
  GridBoardPainter({required this.rows, required this.cols});
  final int rows, cols;

  @override
  void paint(Canvas canvas, Size size) {
    final cellW = size.width / cols;
    final cellH = size.height / rows;

    final light = Paint()..color = const Color.fromARGB(155, 251, 248, 248); // const Color(0xFFEDEDED);
    final dark = Paint()..color =  const Color.fromARGB(155, 88, 17, 3);
    final border = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black.withValues(alpha:0.8);

    // Fill alternating cells
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final rect = Rect.fromLTWH(c * cellW, r * cellH, cellW, cellH);
        canvas.drawRect(rect, ((r + c) & 1) == 0 ? light : dark);
      }
    }

    // Draw the grid lines
    for (int c = 0; c <= cols; c++) {
      final x = c * cellW;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), border);
    }
    for (int r = 0; r <= rows; r++) {
      final y = r * cellH;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), border);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}