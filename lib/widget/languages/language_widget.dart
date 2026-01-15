import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {

  final Locale language;

  const LanguageWidget({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset( 
          'assets/images/${language.languageCode}_flag.png',
          width: 150,
        ),
        Image.asset( 
          'assets/images/cask.png',
          width: 150,
        ),
      ],
    );
  }
}