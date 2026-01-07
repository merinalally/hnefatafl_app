import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/model/game_team.dart';
import 'package:tafl_app/model/game_turn.dart';
import 'package:tafl_app/provider/game_turn_provider.dart';
import 'package:tafl_app/widget/turn_animated_widget.dart';
import 'package:tafl_app/widget/game/navigation/turn_icon_widget.dart';
import 'package:tafl_app/widget/turn_pass_widget.dart';


class GameBottomNavigationBar extends ConsumerWidget {

  const GameBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    GameTurn gameTurn = ref.watch(gameTurnProvider);
    GameTeam activeTeam = gameTurn.activeTeam;

    return BottomNavigationBar(
      key: ValueKey(activeTeam),
      backgroundColor: const Color.fromARGB(255, 251, 248, 248),
      onTap: (index){
        // Handle navigation tap
      },
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: activeTeam == GameTeam.attacker
            ? TurnAnimatedWidget(
                key: ValueKey(activeTeam),
                child: TurnIconWidget.attacker(activeTeam: activeTeam == GameTeam.attacker,),
              )
            : TurnIconWidget.attacker(activeTeam: activeTeam == GameTeam.attacker,),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: TurnPassLogo(
            key: ValueKey(activeTeam),
            isClockwise: activeTeam == GameTeam.attacker,
            child: Image.asset('assets/images/weapons.png', color: const Color.fromARGB(255, 88, 17, 3), width: 50, height: 50,)),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: activeTeam == GameTeam.defender
            ? TurnAnimatedWidget(
                key: ValueKey(activeTeam),
                child: TurnIconWidget.defender(activeTeam: activeTeam == GameTeam.defender,),
              )
            : TurnIconWidget.defender(activeTeam: activeTeam == GameTeam.defender,),
        ),
      ],
    );
  }
}