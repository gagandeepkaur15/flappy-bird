import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/planet.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flappy_bird/game/planet_position.dart';

class PlanetGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PlanetGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    double topYPosition =
        _random.nextDouble() * (gameRef.size.y / 2 - 200) + 50;
    double bottomYPosition = topYPosition + 300;

    final variation = _random.nextInt(3);

    const spaceForBird = 330.0;

    switch (variation) {
      case 0:
        topYPosition = spaceForBird;
        bottomYPosition = topYPosition + spaceForBird;
        break;
      case 1:
        topYPosition =
            _random.nextDouble() * (gameRef.size.y - 2 * spaceForBird);
        bottomYPosition = topYPosition + spaceForBird;
        break;
      case 2:
        bottomYPosition = gameRef.size.y - spaceForBird;
        topYPosition = bottomYPosition - spaceForBird;
        break;
    }

    addAll([
      Planet(yPosition: topYPosition, planetPosition: PlanetPosition.top),
      Planet(yPosition: bottomYPosition, planetPosition: PlanetPosition.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}
