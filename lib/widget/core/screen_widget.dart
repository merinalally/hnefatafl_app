import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget
{
  const ScreenWidget({
    super.key,
    required this.content,
    required this.imageFile,
  });

  final Widget content;
  final String imageFile;

  const ScreenWidget.forest({super.key, required this.content}): imageFile = "assets/images/game.png";
  const ScreenWidget.river({super.key, required this.content}): imageFile = "assets/images/screenV.png";
  const ScreenWidget.village({super.key, required this.content}): imageFile = "assets/images/sceneDrawer.png";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imageFile,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.4),
            child: content,
            /*
            Padding(
              padding: const EdgeInsets.all(2.0), //8
              child: content,
            ),
            */
          ),
        ),
      ],
    );
  }

}