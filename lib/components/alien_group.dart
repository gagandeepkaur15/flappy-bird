import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/alien.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

class AlienGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  AlienGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    addAll([Alien(yPosition: 100)]);
  }
}
