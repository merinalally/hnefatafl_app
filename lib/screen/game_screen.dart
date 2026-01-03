import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/drawer_icon_widget.dart';
import 'package:tafl_app/widget/drawer_widget.dart';
import 'package:tafl_app/widget/game_board_view.dart';
import 'package:tafl_app/widget/game_bottom_navigation_bar.dart';
import 'package:tafl_app/widget/screen_widget.dart';
import 'package:tafl_app/widget/game_over_dialog.dart';


class GameScreen extends ConsumerWidget {
  
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen<GameTeam?>(
      gameControllerProvider.select((s) => s.winner),
      (prev, next) {
        // transition "pas de gagnant" → "gagnant"
        if (prev == null && next != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => GameOverDialog(
                team: next,
                resetGame: ()=>ref.read(gameControllerProvider.notifier).resetGame(),
                goToMenu: ()=>ref.read(screenProvider.notifier).goToMenu(),
              ),
            );
          });
        }
      },
    );

    return Scaffold(
      drawer: GameDrawer(
        resetGame: ()=>ref.read(gameControllerProvider.notifier).resetGame(),
        goToMenu: ()=>ref.read(screenProvider.notifier).goToMenu(),
      ),
      body: ScreenWidget.forest(
        content: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: DrawerIconWidget(),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                Expanded(
                  child: GameBoardView(),
                ),
              ],
            ),
          ),
        ),
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