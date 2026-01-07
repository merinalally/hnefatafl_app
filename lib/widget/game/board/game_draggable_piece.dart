import 'package:flutter/material.dart';

const double kFactor = 1.3;
/// A draggable wrapper that shows a floating feedback while dragging and
/// reports the global drop offset.
class DraggablePiece extends StatelessWidget {
  const DraggablePiece({
    super.key,
    required this.child,
    required this.onDragEnd,
    required this.width,
    required this.height,
    isDraggable = true,
  });

  final Widget child;
  final void Function(DraggableDetails details) onDragEnd;
  final bool isDraggable = true;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: 0, // not used yet, placeholder for future logic
      dragAnchorStrategy: childDragAnchorStrategy,
      maxSimultaneousDrags: isDraggable ? 1 : 0,
      feedback: SizedBox(
        width: kFactor*width,//(context.findRenderObject() as RenderBox?)?.size.width ?? 48,
        height: kFactor*height,//(context.findRenderObject() as RenderBox?)?.size.height ?? 48,
        child: Opacity(opacity: 0.85, child: child),
      ),
      childWhenDragging: Opacity(opacity: 0.2, child: child),
      onDragEnd: onDragEnd,
      child: child,
    );
  }
}