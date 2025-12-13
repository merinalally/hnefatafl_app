import 'package:flutter/material.dart';
import 'package:tafl_app/core/tafl_app_bar.dart';
import 'package:tafl_app/widget/game_board_view.dart';


//TODO add rules
//TODO add Crow animations

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
      //appBar: TaflAppBar(),
      backgroundColor: const Color.fromARGB(150, 88, 17, 3),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: GameBoardView(),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 251, 248, 248),
          onTap: (index){
            // Handle navigation tap
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Text('A', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 88, 17, 3)),),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/images/weapons.png', color: const Color.fromARGB(255, 88, 17, 3), width: 50, height: 50,),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Text('D', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 88, 17, 3).withValues(alpha: 0.3)),),
            ),
          ],
        ),
      ),
    );
  }

}
