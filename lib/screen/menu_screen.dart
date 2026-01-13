import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/widget/core/button/option_button.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';
import 'package:tafl_app/widget/core/title/title_widget.dart';


doNothing(){

}

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Widget content = Center(  
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 3,
        children: [
          TitleWidget(title: "Menu"),
          const SizedBox(height: 5),
          OptionButton.normal(
            text: '2 Players',
            onPressed: ()
            {
              ref.read(gameControllerProvider.notifier).resetGame();
              ref.read(screenProvider.notifier).goToGameBoard();
            },
          ),
          OptionButton.normal(
            text: 'Rules',
            onPressed: (){
              ref.read(screenProvider.notifier).goToRules();
            },
          ),
          const OptionButton.normal(
            text: 'Learn to Play',
            onPressed: doNothing,
          ),
          const OptionButton.normal(
            text: 'Language',
            onPressed: doNothing,
          ),
        ],
      ),
    );

    return Scaffold(
      body: ScreenWidget.river(
        content: content,
      ),
    );

  }
}