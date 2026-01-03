import 'package:flutter/material.dart';
import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/widget/option_button.dart';
import 'package:tafl_app/widget/screen_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tafl_app/widget/title_app_widget.dart';

class GameOverDialog extends StatelessWidget
{
  GameOverDialog({
    super.key, 
    required this.team,
    required this.resetGame,
    required this.goToMenu,
  });

  final GameTeam team;
  final void Function() resetGame;
  final void Function() goToMenu;

  @override
  Widget build(BuildContext context) {

    return Dialog(
      child: SizedBox(
        height: 400,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 88, 17, 3,),
              width: 3,
            ),
          ),
          child: ScreenWidget.forest(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 3,
                children: [
                  TitleAppWidget(),
                  ListTile(
                    title: Text(
                      (team == GameTeam.attacker) ? "Capture du roi" : "Fuite du roi",
                      textAlign: TextAlign.center,
                      style : GoogleFonts.newRocker(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 196, 196, 196),
                      ),
                    ),
                    subtitle: Text(
                      (team == GameTeam.attacker) ? "Victoire des Assaillants" : "Victoire des Défenseurs",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.newRocker(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 196, 196, 196),
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                OptionButton.normal(
                    text: "Nouvelle partie", 
                    onPressed: () {
                      Navigator.pop(context);
                      resetGame();
                    },
                ),
                OptionButton.normal(
                  text: "Retour au menu", 
                  onPressed: () {
                    Navigator.pop(context);
                    goToMenu();
                  },
                ),
                const SizedBox(height: 5),
                ],
              ),
            ),
        ),
      ),
    );

  }

}