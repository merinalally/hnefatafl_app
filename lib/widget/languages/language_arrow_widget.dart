import 'package:flutter/material.dart';

enum Direction { previous, next }

class LanguageArrowWidget extends StatelessWidget {

  final Direction direction; 
  final void Function() onPressed;


  const LanguageArrowWidget({
    super.key,
    required this.direction,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset('assets/images/arrow_${direction.name}.png',
        height: 50,
      ),
    );
  }
}