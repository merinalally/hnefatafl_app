import 'package:flutter/material.dart';

class GameOverBackgroundContainer extends StatelessWidget
{
  const GameOverBackgroundContainer(
    {
      super.key,
    });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black54,
            Colors.black87,
          ],
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
        ),
      ),
    );
  }

}