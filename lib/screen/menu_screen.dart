import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/l10n/app_localizations.dart';
import 'package:tafl_app/widget/core/button/option_button.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';
import 'package:tafl_app/widget/core/title/title_widget.dart';


class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Widget content = Center(  
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleWidget(title: AppLocalizations.of(context)!.menu,),
          const SizedBox(height: 5),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.modeTwoPlayers,
            onPressed: ()
            {
              ref.read(gameControllerProvider.notifier).resetGame();
              ref.read(screenProvider.notifier).goToGameBoard();
            },
          ),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.principle,
            onPressed: (){
              ref.read(screenProvider.notifier).goToRules();
            },
          ),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.variations,
            onPressed: (){
              ref.read(screenProvider.notifier).goToGameSettings();
            },
          ),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.language,
            onPressed: (){
              ref.read(screenProvider.notifier).goToLanguage();   
            },
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