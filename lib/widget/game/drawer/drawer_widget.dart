import 'package:flutter/material.dart';
import 'package:tafl_app/widget/option_button.dart';
import 'package:tafl_app/widget/core/title_app_widget.dart';


class GameDrawer extends StatelessWidget {
  const GameDrawer({
    super.key,
    required this.goToMenu,
    required this.resetGame,
  });

  final void Function() goToMenu;
  final void Function() resetGame;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/game.png',
            fit: BoxFit.cover,
          ),

          // Optional overlay (pour lisibilité)
          Container(
            color: Colors.black.withValues(alpha: 0.4),
          ),

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 3,
              children: [
                TitleAppWidget(),
                const SizedBox(
                  height: 5,
                ),
                OptionButton.normal(
                  text: 'Recommencer', 
                  onPressed: (){
                    resetGame();
                    Navigator.of(context).pop();
                  },
                ),
                OptionButton.normal(text: 'Retour au Menu', onPressed: goToMenu),
                OptionButton.normal(text: 'Fermer', onPressed: (){
                  Navigator.of(context).pop();
                }),
              ],
            ),
          ),
        ],
      ),
    );
         
  }
}
