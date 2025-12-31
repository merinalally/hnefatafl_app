import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final String image;
  final void Function() onPressed;

  const OptionButton({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
  });

  const OptionButton.normal({
    super.key,
    required this.text,
    required this.onPressed,
  }) : image = 'assets/images/button.png';

  const OptionButton.small({
    super.key,
    required this.text,
    required this.onPressed,
  }) : image = 'assets/images/buttonSmall.png';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
          height: 40,
        ),
        TextButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              text,
              style: GoogleFonts.newRocker(
                fontSize: 15,
                color: const Color.fromARGB(255, 88, 29, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}






/*
class OptionButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const OptionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/button.png',
            height: 40,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -3,
          child: Center(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.newRocker(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 88, 29, 0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/