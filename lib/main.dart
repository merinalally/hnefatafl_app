import 'package:flutter/material.dart';
import 'package:tafl_app/game_board_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: const GameApp(),
      ),
  );
}
