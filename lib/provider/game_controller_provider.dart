import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/controller/game_controller.dart';
import 'package:tafl_app/model/game_state.dart';

final gameControllerProvider = NotifierProvider<GameController,GameState>(GameController.new);