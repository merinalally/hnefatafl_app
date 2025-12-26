import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget
{
  const TitleWidget({
    super.key, 
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.newRocker(
        fontSize: 45,
        fontWeight: FontWeight.w300,
        color: const Color.fromARGB(230, 196, 196, 196),
      ),
    );
  }

}