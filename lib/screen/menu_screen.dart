import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/widget/option_button.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/title_widget.dart';


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
          OptionButton(
            text: '1 vs 1 Player',
            onPressed: ()
            {
              ref.read(screenProvider.notifier).goToGameBoard();
            },
          ),
          const OptionButton(
            text: 'Rules',
            onPressed: doNothing,
          ),
          const OptionButton(
            text: 'Learn to Play',
            onPressed: doNothing,
          ),
          const OptionButton(
            text: 'About',
            onPressed: doNothing,
          ),
        ],
      ),
    );

    Widget widget = Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/screenV.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: content,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      body: widget,
    );

  }
}