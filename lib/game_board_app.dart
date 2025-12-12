import 'package:flutter/material.dart';
import 'package:tafl_app/widget/game_board_view.dart';

class GameBoardApp extends StatelessWidget {
  
  const GameBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Board',
      debugShowCheckedModeBanner: false,
      home: const BoardScreen(),
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)),
    );
  }

}

/// BoardScreen: demo container to show the board working.
/// Keep your game rules OUT of GameBoard and IN here (or a controller).
class BoardScreen extends StatelessWidget {
  
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Hnefatafl',  
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 24,),
            ),
            const Text(
              'The Viking Strategy Game',  
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 13,),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 88, 17, 3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: GameBoardView(),
        ),
      ),
    );
  }

}
