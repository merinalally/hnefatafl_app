import 'package:flutter/material.dart';

/// Simple circular piece visual with a label.
class PieceVisual extends StatelessWidget {

  const PieceVisual({
    super.key,
    required this.label,
    required this.color,
  });

  PieceVisual.active({
    super.key,
    required this.label,
  }) : color = Colors.white;

  PieceVisual.inactive({
    super.key,
    required this.label,
  }) : color = Colors.grey;

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [BoxShadow(blurRadius: 6, spreadRadius: 1)],
        border: Border.all(width: 2),
      ),
      child: Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
