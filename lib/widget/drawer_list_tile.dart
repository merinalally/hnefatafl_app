import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget
{
  const DrawerListTile({
    super.key,
    required this.text,
    required this.onClick,
  });

  final void Function() onClick; 
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/weapons.png',
        height: 25,
        color: Color.fromARGB(255, 58, 11, 2),//Color.fromARGB(255, 185, 182, 181),
      ),
      title: Text(
        text,
        style: GoogleFonts.newRocker(
          fontSize: 20,
          fontWeight: FontWeight.w100,
          color: Color.fromARGB(255, 58, 11, 2),//Color.fromARGB(255, 185, 182, 181),
        ),
      ),
      onTap: onClick,
    );
  }




}