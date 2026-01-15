import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/game_board_app.dart';
import 'package:tafl_app/provider/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tafl_app/l10n/app_localizations.dart';


class GameApp extends ConsumerWidget {
  
  const GameApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final locale = ref.watch(localeProvider);
    final supportedLocales = ref.read(supportedLocaleProvider);

    return MaterialApp(
      title: 'Game Board',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true, 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const GameBoardApp(),
    );
  }

}