import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/l10n/app_localizations.dart';
import 'package:tafl_app/provider/locale_provider.dart';
import 'package:tafl_app/widget/core/button/option_button.dart';
import 'package:tafl_app/provider/game_controller_provider.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';
import 'package:tafl_app/widget/core/title/title_widget.dart';
import 'package:tafl_app/widget/languages/language_selector_widget.dart';


class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Widget content = Center(  
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleWidget(title: AppLocalizations.of(context)!.menu,),
          const SizedBox(height: 5),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.modeTwoPlayers,
            onPressed: ()
            {
              ref.read(gameControllerProvider.notifier).resetGame();
              ref.read(screenProvider.notifier).goToGameBoard();
            },
          ),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.principle,
            onPressed: (){
              ref.read(screenProvider.notifier).goToRules();
            },
          ),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.variations,
            onPressed: (){
              ref.read(screenProvider.notifier).goToGameSettings();
            },
          ),
          OptionButton.normal(
            text: AppLocalizations.of(context)!.language,
            onPressed: (){
              showModalBottomSheet(
                backgroundColor: Colors.white12,
                context: context,
                builder: (context) {
                  return Container(
                    height: 230,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LanguageSelectorWidget(
                        currentLocale: ref.watch(localeProvider),
                        onLocaleChange: (locale) {
                          ref.read(localeProvider.notifier).switchLocale(locale);
                        },
                      ),
                    ),
                  );
                }
              );
            },
          ),
        ],
      ),
    );

    return Scaffold(
      body: ScreenWidget.river(
        content: content,
      ),
    );

  }
}