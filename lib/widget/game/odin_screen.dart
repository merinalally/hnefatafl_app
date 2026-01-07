import 'package:flutter/material.dart';
import 'package:tafl_app/widget/game/game_over/game_over_odin_animated_screen.dart';
import 'package:tafl_app/widget/game/game_over/game_over_options_screen.dart';


//TODOML -1000 pour le offset -> dynamique

enum AnimationStep {

  start,
  options,
  end;

  AnimationStep? get next {
    final index = values.indexOf(this);
    if (index + 1 >= values.length) return null;
    return values[index + 1];
  }

}

class OdinScreenWidget extends StatefulWidget {
  
  const OdinScreenWidget({
    super.key, 
    required this.resetGame,
    required this.goToMenu,
  });

  final void Function() resetGame;
  final void Function() goToMenu;

  @override
  State<OdinScreenWidget> createState() {
    return _OdinScreenWidgetState();
  }

}

class _OdinScreenWidgetState extends State<OdinScreenWidget>
{
  AnimationStep _animation = AnimationStep.start;

  void _onEnd(){
    AnimationStep? nextAnimation = _animation.next;
    if (nextAnimation != null)
    {
      setState(() {
        _animation = nextAnimation;
      });
    }
    else
    {
      widget.resetGame();
    }
  }

  @override
  Widget build(BuildContext context) {

    return switch(_animation){
      AnimationStep.start => GameOverOdinAnimatedScreen(
        key: ValueKey(AnimationStep.start),
        duration: Duration(milliseconds: 2000), 
        opacity: Interval(0, 1),
        offset: Interval(-1000, 0),
        onEnd: _onEnd,
      ),
      AnimationStep.options => GameOverOdinOptionsScreen(
        key: ValueKey(AnimationStep.options),
        duration: Duration(milliseconds: 1000), 
        opacity: Interval(0,1),
        resetGame: _onEnd,
        goToMenu: widget.goToMenu,
      ),
      AnimationStep.end => GameOverOdinAnimatedScreen(
        key: ValueKey(AnimationStep.end),
        duration: Duration(milliseconds: 1500), 
        opacity: Interval(1,0),
        offset: Interval(0,-1000),
        onEnd: _onEnd,
      ),
    };

  }

}