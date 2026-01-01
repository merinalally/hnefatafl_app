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
            color:const Color.fromARGB(255, 251, 248, 248).withValues(alpha: 0.8),
            width: 30,
          ),
        ).toList(),
      ),
    );
  }

}