import 'package:flutter/material.dart';
import 'package:tafl_app/screen/game_screen.dart';
import 'package:tafl_app/screen/language_screen.dart';
import 'package:tafl_app/screen/menu_screen.dart';
import 'package:tafl_app/screen/rule_screen.dart';
import 'package:tafl_app/screen/rules_settings_screen.dart';
import 'package:tafl_app/screen/start_screen.dart';
import 'package:tafl_app/provider/game_screen_provider.dart';

Map<GamePage, Widget Function(BuildContext)> pageBuilders = {
  GamePage.start: (context) => StartScreen(),
  GamePage.menu: (context) => MenuScreen(),
  GamePage.gameBoard: (context) => GameScreen(),
  GamePage.rules : (context) => RuleScreen(),
  GamePage.gameSettings : (context) => RulesSettingsScreen(),
  GamePage.language : (context) => LanguageScreen(),
};