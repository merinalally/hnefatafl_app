import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/core/button/option_button.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';
import 'package:tafl_app/widget/core/title/title_app_widget.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Widget content = InkWell(
      onTap: () {
        ref.read(screenProvider.notifier).goToMenu();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: TitleAppWidget(),
          ),
          OptionButton.normal(
            text: 'Start', 
            onPressed: (){
              ref.read(screenProvider.notifier).goToMenu();
            },
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
    
    return Scaffold(
      body: ScreenWidget.river(content: content),
    );
  }
}