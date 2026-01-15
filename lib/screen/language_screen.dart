import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/l10n/app_localizations.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';
import 'package:tafl_app/provider/locale_provider.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';
import 'package:tafl_app/widget/core/title/title_widget.dart';
import 'package:tafl_app/widget/core/drawer/drawer_icon_widget.dart';
import 'package:tafl_app/widget/core/drawer/drawer_widget.dart';
import 'package:tafl_app/widget/languages/language_selector_widget.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  void _onLocaleChange(WidgetRef ref, Locale locale) {
    // Implement language change logic here
    ref.read(localeProvider.notifier).switchLocale(locale);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Locale currentLocale = ref.watch(localeProvider);

    return Scaffold(
      drawer: GameDrawer.settings(
        goToMenu: ()=>ref.read(screenProvider.notifier).goToMenu(),
      ),
      body: ScreenWidget.forest(
        content: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: DrawerIconWidget(),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //TitleAppWidget(),
                    TitleWidget(title: AppLocalizations.of(context)!.language,),
                    const SizedBox(height: 10),
                    LanguageSelectorWidget(
                      currentLocale: currentLocale,
                      onLocaleChange: (locale) => _onLocaleChange(ref, locale),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}