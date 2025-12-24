import 'package:flutter/material.dart';

class TurnPassLogo extends StatefulWidget {
  final Widget child;
  final bool isClockwise;

  const TurnPassLogo({super.key, required this.child, required this.isClockwise});

  @override
  State<TurnPassLogo> createState() => _TurnPassLogoState();
}

class _TurnPassLogoState extends State<TurnPassLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward(); // animation one-shot
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(
        begin: 0,
        end: widget.isClockwise ? 1.0 : -1.0,
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      ),
      child: widget.child,
    );
  }
}

