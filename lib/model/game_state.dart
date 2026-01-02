import 'package:tafl_app/model/game_team.dart';

class GameState {
  final GameTeam? winner; // null = no event
  //final bool restart;

  GameState({this.winner,/* this.restart = false*/});

  GameState copyWith({GameTeam? winner,/* bool? restart*/}) {
    return GameState(
      winner: winner,
      //restart: restart ?? this.restart,
    );
  }

  static GameState initial() => GameState();
}
