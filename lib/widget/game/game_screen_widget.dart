import 'package:flutter/material.dart';
import 'package:tafl_app/widget/core/drawer/drawer_icon_widget.dart';
import 'package:tafl_app/widget/game/board/game_board_view.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';

//TODO block when endgame ?

class GameScreenWidget extends StatelessWidget {
  
  const GameScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenWidget.forest(
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
      );
  }

}