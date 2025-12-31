import 'package:flutter/material.dart';
import 'package:tafl_app/game_board_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO Define MVP
// Animation Click
// Sound Button -> Son Menu + Son fond + Son Bouton + Son Interaction
// Animation Son Victoire
// Flutter Native Splash Screen -> package
// Push Notification (Firebase)
// Versioning Control (Remote Config Tps Reel)
// Contact -> utilisateur remonte un pb -> version OS, type tel 
// (test integration) -> APRES
// Analytics Firebase
// Crashlytics (Firebase)
// device_info_plus
// envoie un mail automatiquement (token autorisation)
//launchdarkly

// TODO Monetization

//TODO Button Leave Rules, Game
//TODO Video

//TODO Fix Size First Move

//TODO Implement Rules

//TODO End Game


void main() {
  runApp(
    ProviderScope(
      child: const GameApp(),
      ),
  );
}
