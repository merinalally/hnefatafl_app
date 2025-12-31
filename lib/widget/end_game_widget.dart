import 'package:flutter/material.dart';
import 'package:tafl_app/widget/game_bottom_navigation_bar.dart';
import 'package:tafl_app/widget/screen_widget.dart';

class WinDialog extends StatelessWidget
{
    const WinDialog({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenWidget.forest(
        content: SizedBox(
            height: 300,
            width: 400,
          child: Stack(
              children: [
                  Positioned(
                      child: Image.asset(
                          'assets/images/end.png',
                          fit: BoxFit.fitHeight,
                      ),
                  ),
              ],
              ),
        ),
      ),
    bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: GameBottomNavigationBar(),
      ),
    );
  }


}