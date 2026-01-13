import 'package:flutter/material.dart';
import 'package:tafl_app/widget/game/game_over/game_over_background_container.dart';
import 'package:tafl_app/widget/game/game_over/odin_widget.dart';
import 'package:tafl_app/widget/core/button/option_button.dart';
import 'package:tafl_app/widget/core/title/title_app_widget.dart';

class GameOverOdinOptionsScreen extends StatefulWidget
{
  const GameOverOdinOptionsScreen({
    super.key,
    required this.opacity,
    required this.duration,
    required this.resetGame,
    required this.goToMenu,
  });

  final Interval opacity;
  final Duration duration;
  final void Function() resetGame;
  final void Function() goToMenu;

  @override
  State<GameOverOdinOptionsScreen> createState() {
    return _GameOverOdinOptionsScreenState();
  }
}

class _GameOverOdinOptionsScreenState extends State<GameOverOdinOptionsScreen>
{
  late double _opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _opacity = widget.opacity.begin;

    Future.delayed(
      Duration(milliseconds: 100),(){
        setState((){
          _opacity = widget.opacity.end;
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: 
      [
        GameOverBackgroundContainer(),
        OdinWidget(),
        AnimatedOpacity(
          opacity: _opacity, 
          duration: widget.duration,
          child : SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleAppWidget(),
                Padding(
                  padding: const EdgeInsets.only(bottom : 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 3,
                    children: [
                      OptionButton.normal(
                        text: 'Recommencer', 
                        onPressed: widget.resetGame,
                      ),
                      OptionButton.normal(
                        text: 'Retour au Menu', 
                        onPressed: widget.goToMenu,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),        
      ],
    );
  }

}