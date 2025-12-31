import 'package:flutter/material.dart';
import 'package:tafl_app/widget/turn_animated_widget.dart';
import 'package:tafl_app/widget/turn_pass_widget.dart';


class MenuBottomNavigationBar extends StatelessWidget {

  const MenuBottomNavigationBar({
    super.key,
    required this.previous,
    required this.next,
  });

  final void Function() next;
  final void Function() previous;

  @override
  Widget build(BuildContext currentContext) {

    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 251, 248, 248),
      onTap: (index){
        if (index == 0)
        {
          previous();
          return;
        }
        else if (index == 2)
        {
          next();
          return;
        }
        // Handle navigation tap
      },
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: Image.asset(
            'assets/images/arrowL.png',
            color: const Color.fromARGB(255, 88, 17, 3).withValues(alpha: 0.9),
            width: 40,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: TurnPassLogo(
            isClockwise: true,
            child: Image.asset('assets/images/weapons.png', color: const Color.fromARGB(255, 88, 17, 3), width: 50, height: 50,)),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: TurnAnimatedWidget(
            child: Image.asset(
              'assets/images/arrowR.png',
              color: const Color.fromARGB(255, 88, 17, 3).withValues(alpha: 0.9),
              width: 40,
            ),
          ),
        ),
      ],
    );
  }
}