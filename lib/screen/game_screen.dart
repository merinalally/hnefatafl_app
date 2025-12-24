import 'package:flutter/material.dart';
import 'package:tafl_app/widget/game_board_view.dart';
import 'package:tafl_app/widget/game_bottom_navigation_bar.dart';
import 'package:tafl_app/widget/screen_widget.dart';


class GameScreen extends StatelessWidget {
  
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ScreenWidget.forest(
        content: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: GameBoardView(),
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
