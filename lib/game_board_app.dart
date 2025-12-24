import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/screen/menu_screen.dart';
import 'package:tafl_app/screen/start_screen.dart';
import 'package:tafl_app/screen/game.dart';

Map<GamePage, Widget Function(BuildContext)> pageBuilders = {
  GamePage.start: (context) => StartScreen(),
  GamePage.menu: (context) => MenuScreen(),
  GamePage.gameBoard: (context) => const Game(),
};

class GameApp extends StatelessWidget {
  
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Game Board',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const GameBoardApp(),
    );
  }

}


class GameBoardApp extends ConsumerWidget {
  const GameBoardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScreen = ref.watch(screenProvider);

    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          final slide = Tween<Offset>(
            begin: const Offset(0.1, 0.0),
            end: Offset.zero,
          ).animate(animation);
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: slide, child: child),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(currentScreen),
          child: pageBuilders[currentScreen]!(context),
        ),
      );
  }
}


