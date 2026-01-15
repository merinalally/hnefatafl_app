import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GamePage {
  start,
  menu,
  gameBoard,
  gameSettings,
  rules,
  language,
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
  void goToRules(){
    state = GamePage.rules;
  }
  void goToGameSettings(){
    state = GamePage.gameSettings;
  }
  void goToLanguage(){
    state = GamePage.language;
  }
}

final screenProvider = NotifierProvider<GamePageNotifier,GamePage>(GamePageNotifier.new);
