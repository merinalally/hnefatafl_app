import 'package:flutter/material.dart';
import 'package:tafl_app/l10n/app_localizations.dart';
import 'package:tafl_app/widget/core/button/option_button.dart';
import 'package:tafl_app/widget/core/title/title_app_widget.dart';

//TODO pour le menu, pop le drawer avant de naviguer ?

enum DrawerOption {
  restart(
    labelBuilder: _restartLabel,
    popAfter: true,
  ),
  backToMenu(
    labelBuilder: _backToMenuLabel,
    popAfter: false,
  ),
  close(
    labelBuilder: _closeLabel,
    popAfter: true,
  );

  final String Function(AppLocalizations l10n) labelBuilder;
  final bool popAfter;

  const DrawerOption({
    required this.labelBuilder,
    required this.popAfter,
  });

  String label(BuildContext context) {
    return labelBuilder(AppLocalizations.of(context)!);
  }

  // --- label builders ---
  static String _restartLabel(AppLocalizations l10n) => l10n.restart;
  static String _backToMenuLabel(AppLocalizations l10n) => l10n.backToMenu;
  static String _closeLabel(AppLocalizations l10n) => l10n.close;
}



class GameDrawer extends StatelessWidget {
  const GameDrawer._({
    required this.options,
  });

  GameDrawer.game({
    required VoidCallback goToMenu,
    required VoidCallback resetGame,
  }) : this._(
          options: {
            DrawerOption.restart: resetGame,
            DrawerOption.backToMenu: goToMenu,
            DrawerOption.close: null,
          },
        );

  GameDrawer.settings({
    required VoidCallback goToMenu,
  }) : this._(
          options: {
            DrawerOption.backToMenu: goToMenu,
            DrawerOption.close: null,    
          },
        );

  final Map<DrawerOption, VoidCallback?> options;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/game.png',
            fit: BoxFit.cover,
          ),

          // Optional overlay (pour lisibilité)
          Container(
            color: Colors.black.withValues(alpha: 0.4),
          ),

          // Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 3,
              children: [
                TitleAppWidget(),
                const SizedBox(
                  height: 5,
                ),
                ...options.entries.map((entry) {
                  final option = entry.key;
                  final action = entry.value;

                  return OptionButton.normal(
                      text: option.label(context),
                      onPressed: () {
                        action?.call();
                        if (option.popAfter) Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
         
  }
}

