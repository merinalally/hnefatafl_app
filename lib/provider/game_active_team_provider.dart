import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/game_team.dart';

class ActiveTeamNotifier extends Notifier<GameTeam> {
  @override
  GameTeam build() => GameTeam.defender;
  void update(){
    GameTeam newState = state == GameTeam.attacker ? GameTeam.defender : GameTeam.attacker;
    state = newState;
  }
}

final activeTeamProvider = NotifierProvider<ActiveTeamNotifier,GameTeam>(ActiveTeamNotifier.new);
