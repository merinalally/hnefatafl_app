import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/drawer_icon_widget.dart';
import 'package:tafl_app/widget/drawer_widget.dart';
import 'package:tafl_app/widget/game_board_view.dart';
import 'package:tafl_app/widget/game_bottom_navigation_bar.dart';
import 'package:tafl_app/widget/screen_widget.dart';


class GameScreen extends ConsumerWidget {
  
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.read(gameControllerProvider.notifier).resetGame();

    return Scaffold(
      drawer: GameDrawer(
        goToMenu: (){
          ref.read(screenProvider.notifier).goToMenu();
        },
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
