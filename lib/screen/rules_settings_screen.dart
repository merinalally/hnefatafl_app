import 'package:flutter/material.dart';
import 'package:tafl_app/widget/core/screen_widget.dart';
import 'package:tafl_app/widget/core/title/title_widget.dart';

class RulesSettingsScreen extends StatelessWidget {
  const RulesSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenWidget.river(
        content: Center(
          child: TitleWidget(title: "Rules Settings Screen"),
        ),
      ),
    );
  }
}