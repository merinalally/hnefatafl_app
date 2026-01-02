import 'package:flutter/material.dart';
import 'package:tafl_app/model/game_team.dart';

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
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 39, 5, 2),
          borderRadius: BorderRadius.circular(5),  
          border: Border.all(color: Colors.white, width: 1),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Image.asset( 
                (team == GameTeam.attacker) ? 'assets/images/soldier.png' : 'assets/images/king.png',
                height: 100,
                //color: Colors.white60,
              ),
              title: Text(
                (team == GameTeam.attacker) ? "Capture du roi par les Assaillants" : "Fuite du roi par les Défenseurs",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(
            color: Colors.white,
            thickness: 1,
          ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: const Text("Nouvelle partie"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                goToMenu();
              },
              child: const Text("Retour au menu"),
            ),
            const SizedBox(height: 10),
            Image.asset(  
              'assets/images/weapons.png',
              height: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );

  }

}