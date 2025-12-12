import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/controller/game_controller.dart';

final gameControllerProvider = NotifierProvider<GameController,void>(GameController.new);