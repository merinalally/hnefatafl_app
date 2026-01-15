import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/core/drawer/drawer_widget.dart';
import 'package:tafl_app/widget/game/navigation/game_bottom_navigation_bar.dart';
import 'package:tafl_app/widget/game/odin_screen.dart';
import 'package:tafl_app/widget/game/game_screen_widget.dart';


class GameScreen extends ConsumerWidget {
  
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    GameTeam? winner = ref.watch(gameControllerProvider).winner;

    Widget game = GameScreenWidget();

    return Scaffold(
      drawer: GameDrawer.game(
        resetGame: ()=>ref.read(gameControllerProvider.notifier).resetGame(),
        goToMenu: ()=>ref.read(screenProvider.notifier).goToMenu(),
      ),
      body: (winner == null) ? 
      game :
      Stack(
        children: 
        [
          game,
          OdinScreenWidget(
            resetGame: ()=>ref.read(gameControllerProvider.notifier).resetGame(),
            goToMenu: ()=>ref.read(screenProvider.notifier).goToMenu(),
          ),
        ],   
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: GameBottomNavigationBar(),
      ),
    );
    
  }

}