import 'package:flutter/material.dart';

class TurnIconWidget extends StatelessWidget {
  
  final bool activeTeam;
  final String label;

  const TurnIconWidget.attacker({super.key, required this.activeTeam,}) 
    : label = 'A';

  const TurnIconWidget.defender({super.key, required this.activeTeam,}) 
    : label = 'D';

  const TurnIconWidget({
    super.key, 
    required this.activeTeam,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label, 
      style: TextStyle(
        fontSize: 30, 
        fontWeight: FontWeight.bold, 
        color: Color.fromARGB(255, 88, 17, 3,).withValues(alpha: activeTeam ? 0.7 : 0.2),
      ),
    );
  }

}