import 'package:flutter/material.dart';
import 'package:tafl_app/widget/core/button/option_button.dart';
import 'package:tafl_app/widget/languages/language_arrow_widget.dart';
import 'package:tafl_app/widget/languages/language_widget.dart';
import 'package:tafl_app/data/locale.dart';


class LanguageSelectorWidget extends StatelessWidget {

  const LanguageSelectorWidget({
    super.key,
    required this.onLocaleChange,
    required this.currentLocale,
  });
  
  final Function(Locale locale) onLocaleChange;
  final Locale currentLocale;

  int get initialIndex => kSupportedLocale.indexWhere((locale) => locale == currentLocale);

  void _nextLanguage(){
    int index = (initialIndex + 1) % kSupportedLocale.length;
    _setLanguage(kSupportedLocale[index]);
  }

  void _previousLanguage(){
    int index = (initialIndex - 1) % kSupportedLocale.length;
    _setLanguage(kSupportedLocale[index]);
  }

  void _setLanguage(Locale locale){
    onLocaleChange(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [ 
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LanguageArrowWidget(
                direction: Direction.previous, 
                onPressed: _previousLanguage,
              ),
              LanguageWidget(
                language: currentLocale,
              ),
              LanguageArrowWidget(
                direction: Direction.next, 
                onPressed: _nextLanguage,
              ),
            ],
          ),
        ),
        OptionButton.small(
          text: currentLocale.languageCode.toUpperCase(), 
          onPressed: (){},
        ),
    
        const SizedBox(height: 10),  
      ],
    );
  }
}