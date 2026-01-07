import 'package:flutter/material.dart';
import 'package:tafl_app/widget/game/game_over/game_over_background_container.dart';
import 'package:tafl_app/widget/game/game_over/odin_widget.dart';

class GameOverOdinAnimatedScreen extends StatefulWidget
{
  const GameOverOdinAnimatedScreen({
    super.key,
    required this.duration,
    required this.opacity,
    required this.offset,
    required this.onEnd,
  });

  final Duration duration;
  final Interval opacity;
  final Interval offset;
  final void Function() onEnd;

  @override
  State<GameOverOdinAnimatedScreen> createState() {
    return _GameOverOdinAnimatedScreenState();
  }

}

class _GameOverOdinAnimatedScreenState extends State<GameOverOdinAnimatedScreen> 
{
  late double _opacity;
  late double _offset;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _opacity = widget.opacity.begin;
    _offset = widget.offset.begin;
    Future.delayed(
      Duration(milliseconds: 100),(){
        setState((){
          _opacity = widget.opacity.end;
          _offset = widget.offset.end;
        }
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: 
      [
        AnimatedOpacity(
          opacity: _opacity, 
          duration: widget.duration, 
          child: GameOverBackgroundContainer(),
        ),
        AnimatedPositioned(
          duration: widget.duration,
          curve: Curves.easeOut,
          bottom: _offset,
          left: 0,
          right: 0,
          onEnd: widget.onEnd,
          child: OdinWidget(),
        ),
      ],
    );
  }

}