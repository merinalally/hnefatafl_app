import 'package:flutter/material.dart';

class DrawerIconWidget extends StatelessWidget
{
  const DrawerIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 2.5,
        children: [1,2,3].map(
          (index)=>Image.asset(
            'assets/images/drawer.png',
            color:Color.fromARGB(255, 75, 16, 2).withValues(alpha: 0.9),
            width: 30,
          ),
        ).toList(),
      ),
    );
  }

}