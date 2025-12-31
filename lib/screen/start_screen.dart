import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/option_button.dart';
import 'package:tafl_app/widget/screen_widget.dart';
import 'package:tafl_app/widget/title_widget.dart';

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
            child: Stack(
              alignment: Alignment.center,
              children: 
              [
                Image.asset(
                'assets/images/title.png',
                color:Color.fromARGB(205, 228, 152, 82),
                height: 150,
                ),
                Positioned.fill(
                  child:Center(
                    child: Image.asset(
                    'assets/images/title.png',
                    color:Color.fromARGB(255, 88, 17, 3,),
                    height: 148,
                    ),
                  ),
                )
              
              ],
            ),
          ),
          //TitleWidget(title: "Hfnatalf",),
          OptionButton.normal(
            text: 'Start', 
            onPressed: (){
              ref.read(screenProvider.notifier).goToMenu();
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
           height: 60,
          ),
        ],
      ),
    );
    
    return Scaffold(
      body: ScreenWidget.river(content: content),
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