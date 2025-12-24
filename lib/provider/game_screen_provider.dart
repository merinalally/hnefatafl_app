import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GamePage {
  start,
  menu,
  gameBoard,
} 

class GamePageNotifier extends Notifier<GamePage> {
  @override
  GamePage build() => GamePage.start;
  void goToGameBoard(){
    state = GamePage.gameBoard;
  }
  void goToMenu(){
    state = GamePage.menu;
  }
  void goToStart(){
    state = GamePage.start;
  }
}

final screenProvider = NotifierProvider<GamePageNotifier,GamePage>(GamePageNotifier.new);
