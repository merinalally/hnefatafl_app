import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/option_button.dart';
import 'package:tafl_app/widget/title_widget.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Widget content = InkWell(
      onTap: () {
        ref.read(screenProvider.notifier).goToMenu();
      },
      child: Center(  
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleWidget(title: "Hfnatalf",),
            const SizedBox(height: 8),
            OptionButton(
              text: 'Start', 
              onPressed: (){
                ref.read(screenProvider.notifier).goToMenu();
              },
            ),
          ],
        ),
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

/*
    return Scaffold(
      backgroundColor: const Color.fromARGB(150, 88, 17, 3),
      body: Container(
        child: Center(
          child: Column(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hfnatafl',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(screenProvider.notifier).goToMenu();
                },
                child: const Text(
                  'Start Game',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(  
                'assets/images/weapons.png',
                height: 50,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/