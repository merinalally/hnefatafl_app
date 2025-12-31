import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/controller/game_controller.dart';
import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/provider/game_play_provider.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/provider/game_turn_provider.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/screen/game_screen.dart';
import 'package:tafl_app/core/colors.dart';


class Game extends ConsumerWidget {
  Game({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ProviderScope(
     //key: UniqueKey(),
      overrides: [
        gamePlayProvider.overrideWith(GamePlayNotifier.new),
        gameTurnProvider.overrideWith(GameTurnNotifier.new), // also scoped fresh
        gameControllerProvider.overrideWith(GameController.new),
      ],
      child: _GameRoot(),
    );
  }
}

class _GameRoot extends ConsumerWidget {
  const _GameRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameControllerProvider); // ensure instance is created

    // ✅ WIN EVENT LISTENER
    ref.listen(gameControllerProvider.select((state) => state.winner), (prev, winner) {
      if (winner != null) {
        ref.read(gameControllerProvider.notifier).clearWinnerEvent();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showWinDialog(context, ref, winner);
        });
      }
    });

    // ✅ RESTART EVENT LISTENER
    ref.listen(gameControllerProvider.select((state) => state.restart), (prev, restart) {
      if (restart) {
        ref.read(gameControllerProvider.notifier).clearRestartEvent();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Game()),
          );
        });
      }
    });

    return const GameScreen();
  }

  void _showWinDialog(BuildContext context, WidgetRef ref, GameTeam team) async {

    Widget content = Container(
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
                color: kWhite,
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
              ref.read(gameControllerProvider.notifier).requestRestart();
            },
            child: const Text("Nouvelle partie"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(screenProvider.notifier).goToMenu();
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
    );

    
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(  
        child: content,
      ),
    );
    
  }
}